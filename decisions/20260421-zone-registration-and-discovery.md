# Zone Registration and Discovery

## The Context

A client needs to know which zone servers are running, what addresses they listen on, and how to authenticate the connection. Zone servers are ephemeral — they start, run, and stop independently of the backend. The backend must reflect only what is currently alive.

## The Problem Statement

Static configuration of zone server addresses does not work when zone servers restart, migrate, or scale horizontally. A registry with heartbeat-based expiry gives clients a live view of the cluster without requiring any coordination between zone servers.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

Zone servers self-register with zone-backend over HTTP and maintain their registration with periodic heartbeats.

On boot, a zone server sends `POST /shards` with its `address`, `port`, `map`, `name`, and `cert_hash`. Zone-backend writes a row to the `zones` table and returns the assigned UUID. The zone server stores this UUID and uses it for all subsequent requests.

Every 25 seconds the zone server sends `PUT /shards/:id`. This touches the row's `updated_at` timestamp. No body is required; a bare PUT is a valid keepalive. The response includes the current `desync_index_url` for the zone's map, which the zone server can use to confirm asset availability.

`ZoneJanitor`, a GenServer, runs on a configurable interval and deletes rows whose `updated_at` has fallen outside the staleness window (default 30 seconds). A zone that misses two heartbeat cycles is treated as dead and removed.

Clients call `GET /shards` to retrieve all live zones. Each record contains `address`, `port`, `cert_hash`, and `desync_index_url`. The client uses `address` and `port` to open a WebTransport connection and `cert_hash` to pin the server's self-signed certificate.

The `zones` schema fields are: `address` (string), `port` (integer, UDP 7443–7542), `map` (string), `name` (string), `current_users` (integer, default 0), `max_users` (integer, default 32), `cert_hash` (Base64 SHA-256 fingerprint), and an optional `user_id` foreign key.

Clients can also subscribe to `zone:{id}` on the Phoenix WebSocket to receive `zone_updated` events in real time. Zone-backend broadcasts this event on every heartbeat with the current `desync_index_url`, so clients learn when a new asset bake becomes available without polling.

## The Benefits

Zone servers require no shared configuration file and no coordination with each other. Adding a zone server means starting a process; removing one means stopping it. The staleness window is short enough that clients see a stale entry for at most two missed heartbeat cycles.

## The Downsides

A zone server that crashes between heartbeats leaves a stale row for up to 30 seconds. Clients that connect during that window will receive a connection error.

## The Road Not Taken

A service mesh or DNS-based discovery (Consul, Kubernetes headless services) would provide similar liveness guarantees but requires additional infrastructure. The HTTP heartbeat approach works with a single backend process and no external dependencies.

## The Infrequent Use Case

A zone server running behind a NAT where `conn.remote_ip` is the NAT address rather than the public address must supply an explicit `address` field in its `POST /shards` payload. If `address` is omitted, zone-backend fills it from the request's remote IP.

## In Core and Done by Us

`Uro.ZoneController` in `multiplayer-fabric-zone-backend` handles registration, heartbeat, and deletion. `Uro.VSekai.ZoneJanitor` handles expiry. `Uro.ZoneChannel` handles WebSocket delivery.

## Status

Status: Accepted

## Decision Makers

- iFire

## Tags

- Zone, Registration, Discovery, Heartbeat, Janitor, WebSocket, CertPin

## Further Reading

1. `multiplayer-fabric-zone-backend/lib/uro/controllers/zone.ex` — HTTP handlers
2. `multiplayer-fabric-zone-backend/lib/uro/v_sekai/zone_janitor.ex` — staleness expiry
3. `multiplayer-fabric-zone-backend/lib/uro/channels/zone_channel.ex` — real-time delivery
4. `multiplayer-fabric-zone-backend/lib/uro/v_sekai/zone.ex` — schema and changeset
