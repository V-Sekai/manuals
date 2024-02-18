# Proposed: Handling access to session based game data

## Metadata

- Status: proposed
- Deciders: V-Sekai
- Tags: V-Sekai, GPT-4

## Context and Problem Statement

V-Sekai is facing limitations in handling large amounts of data efficiently and securely. The current system needs improvements in data management, performance, and security.

## Proposed Solution

Assigning session IDs and URLs to every asset to improve data management, performance, and security.

## Implementation

1. Generate unique session IDs and URLs for each asset.
2. Store the session IDs and URLs in a secure database.
3. Use the session IDs and URLs for accessing and managing assets.

## Positive Consequences

- Improved data management through unique identifiers for each asset.
- Enhanced security by using session IDs and URLs for access control.
- Better performance due to efficient asset management.

## Negative Consequences

- Increased complexity in the system architecture.
- Potential challenges in implementing and maintaining unique session IDs and URLs.

## Option graveyard

1. **Caching assets locally**: This option was considered for improving performance, but it would not address data management and security concerns.
2. **Using a centralized server for asset management**: This approach could improve data management but might introduce single points of failure and potential bottlenecks in performance.
3. **Encrypting all assets**: While this would enhance security, it would not address data management issues and could negatively impact performance due to the overhead of encryption and decryption processes.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, this enhancement requires significant changes to the system architecture and cannot be achieved with a simple script workaround.

## Is there a reason why this should be core and done by us?

Yes, this enhancement addresses core limitations in the V-Sekai system and should be implemented by the V-Sekai team to ensure proper integration and compatibility with existing components.

## References

- [V-Sekai](https://v-sekai.org/)
