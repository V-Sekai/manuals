# Content-Addressed Asset Delivery

## The Context

When a player enters a zone or a new asset is instanced, the client needs the asset data. Sending the full asset every time wastes bandwidth. Sending a diff requires both sides to agree on a base version. Content-addressing solves this by identifying chunks by their hash: a client that already has a chunk never downloads it again, regardless of which asset it came from or how many times it has been seen.

## The Problem Statement

Game asset delivery has no standard delta-sync mechanism. OS image distribution solved this problem years ago with content-defined chunking and SHA-256-addressed stores. The game-engine integration of that approach has never been built.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

Assets are baked into a `.caibx` index file and a set of chunks stored in an S3-compatible object store. The index is a binary structure containing a `FormatIndex` header followed by a `FormatTable` of `IndexChunk` entries. Each entry holds a 32-byte SHA-512/256 chunk ID, a start offset, and a size. Chunk boundaries are determined by a rolling hash (SipHash over a 48-byte window) with a target size of 64 KB and a range of 16 KB to 256 KB.

The chunk server (`multiplayer-fabric-desync`) serves chunks over HTTP. A client fetches a chunk with `GET /chunks/<sha256_hex>` and receives the zstd-compressed chunk body. The chunk server reads from an S3-compatible backend; in the reference deployment this is versitygw, an S3-compatible gateway over a local POSIX filesystem.

The delivery flow for a zone asset is:

```
asset uploaded → baked to .caibx + chunks → chunks stored in S3
zone heartbeat (PUT /shards/:id) → zone-backend looks up SharedFile.baked_url
  → broadcasts desync_index_url via Phoenix Channel "zone:{id}"
client receives desync_index_url → fetches .caibx index → fetches only missing chunks
  → reassembles asset locally
```

The `CMD_INSTANCE_ASSET` packet (opcode 0x04, 100 bytes) carries the asset UUID and world position. The authority zone fetches the manifest, allocates an entity slot, and broadcasts the instance to neighbouring zones via `CH_INTEREST`. Clients that already have all chunks for that asset reconstruct it from their local cache without a network round-trip.

## The Benefits

Clients only download chunks they do not already have. The same chunk appearing in multiple assets or asset versions is transferred once. The chunk store is append-only and requires no coordination between writer and reader.

## The Downsides

The baking step adds latency between upload and availability. A client that has no local cache downloads every chunk on first access. The S3 credentials in the reference deployment (`minioadmin`/`minioadmin`) are development defaults and must be replaced before any public deployment.

## The Road Not Taken

Serving whole asset files over HTTP is simpler but transfers redundant data across asset versions. A binary diff format (bsdiff, xdelta) requires a known base version on the client and adds complexity at the server.

## The Infrequent Use Case

Very small assets (under 16 KB) are smaller than one chunk and gain nothing from deduplication. They are still served through the same path for uniformity.

## In Core and Done by Us

`multiplayer-fabric-desync` contains the chunk server. The baking pipeline runs in zone-backend. The `desync_index_url` field is computed by `Uro.VSekai.get_desync_url_for_map/1` and delivered over the `ZoneChannel` WebSocket.

## Status

Status: Accepted

## Decision Makers

- iFire

## Tags

- casync, desync, Asset, Delivery, ChunkServer, S3, CAIBX, Zone

## Further Reading

1. `multiplayer-fabric-desync/` — chunk server implementation
2. `multiplayer-fabric-zone-backend/lib/uro/v_sekai.ex` — `get_desync_url_for_map/1`
3. `multiplayer-fabric-zone-backend/lib/uro/channels/zone_channel.ex` — `ZoneChannel` delivery
4. `multiplayer-fabric-hosting/docker-compose.yml` — desync and versitygw service definitions
