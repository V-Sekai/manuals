# Draft: Provide a V-Sekai Starter Kit

## The Context

Provide a V-Sekai starter kit that is complete and usable.

## The Problem Statement

Use desync (casync) to generate catars. Then upload this to itchio.

## Design

We will use the `casync` tool to create `.catar` files from our project directory. This will be followed by uploading these files to Itch.io using their Butler CLI tool.

```bash
# Generate .catar file
casync make myproject.catar myproject/

# Upload to Itch.io
butler push myproject.catar user/game:channel
```

## The Benefits

Seed a cdn. This will allow us to distribute our SDK more efficiently and reliably.

## The Downsides

The main downside is the additional complexity introduced by the use of `casync` and Butler. There may also be potential issues with compatibility or performance.

## The Road Not Taken

An alternative approach could have been to directly upload the SDK files to Itch.io without using `casync`. However, this would not provide the benefits of seeding a CDN.

## The Infrequent Use Case

This process might be less efficient for small updates, as it involves creating a new `.catar` file and uploading it each time.

## In Core and Done by Us

This proposal is core to our project and will be implemented by the V-Sekai development team.

## Status

Status: Draft <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai, 20240406-itch-github-actions

## Further Reading


