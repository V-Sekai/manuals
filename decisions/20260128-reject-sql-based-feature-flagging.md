# Rejected: SQL-Based Feature Flagging for Application Configuration

## The Context

During development of the V-Sekai application architecture, a proposal was made to implement SQL-based feature flagging to enable runtime configuration changes without application restarts. This would allow toggling between different implementations (such as Next.js vs LiveView frontends) and enabling/disabling features dynamically.

## The Problem Statement

The development team needed a mechanism to manage feature toggles and configuration changes that would support:
- Gradual rollout of new features
- A/B testing of different implementations
- Runtime configuration changes without service downtime
- Managing separate docker container deployments

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

The proposed SQL-based feature flagging system would:
- Store feature flags and configuration values in database tables
- Provide runtime querying of flag states
- Allow dynamic enabling/disabling of features without code changes
- Support per-user or per-environment flag overrides

However, this approach was rejected in favor of simpler alternatives.

## The Benefits

**Rejected Proposal Benefits (Not Implemented):**
- Dynamic runtime configuration without restarts
- Database-backed configuration management
- Granular control over feature availability
- Potential for user-specific feature toggles

## The Downsides

**SQL-Based Feature Flagging Issues:**
- **Overengineered**: Complex database schema and query logic for simple configuration needs
- **Error-prone**: Configuration stored in database tables is harder to version control and audit
- **Docker Limitations**: Cannot control separate container execution (either run Next.js container or don't)
- **Caching Issues**: Runtime flag changes don't affect code paths that branch during application startup
- **Maintenance Burden**: Additional complexity for operations and debugging

**Runtime Configuration Problems:**
- Some application behavior is determined at startup and cannot be changed dynamically
- Feature flags don't solve the fundamental problem of maintaining parallel implementations
- Introduces potential for inconsistent application state during flag transitions

## The Road Not Taken

**SQL-Based Feature Flagging:**
- Implementing database tables for configuration management
- Building runtime flag evaluation system
- Creating administrative interfaces for flag management
- Handling flag state synchronization across distributed systems

**Dynamic Runtime Configuration:**
- Building systems that allow all configuration to change without restart
- Implementing complex caching invalidation strategies
- Creating sophisticated state management for configuration changes

## The Infrequent Use Case

**When SQL Feature Flagging Might Be Appropriate:**
- Large enterprise applications with hundreds of features requiring granular control
- Systems where configuration changes must take effect immediately without any downtime
- Applications with user-specific feature customization requirements
- Complex A/B testing scenarios requiring database-backed analytics

## In Core and Done by Us

Configuration management is core to application deployment and operations. The development team handles configuration through environment variables, YAML files, and Elixir configuration files (config.exs) rather than implementing complex database-backed systems.

## Status

Status: Rejected <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- iFire
- Lyuma

## Tags

- Configuration, Feature-Flags, Architecture, Elixir, Database, Operations

## Further Reading

1. [Managing feature toggles in teams: The limits of feature toggles](https://thoughtworks.com/en-us/insights/blog/continuous-delivery/limits-of-feature-toggles)
2. [Feature Toggles (aka Feature Flags)](https://martinfowler.com/articles/feature-toggles.html)
3. [Configuration as Code Best Practices](https://12factor.net/config)

---

### Configuration Terminology

1. **Feature Flag**: A mechanism to enable or disable functionality without code changes
2. **Configuration Drift**: When runtime configuration differs from deployed code expectations
3. **Twelve-Factor App**: Application development methodology emphasizing configuration through environment variables
4. **Hot Reload**: Changing application behavior without restarting the process

AI assistant Aria assisted with this article.