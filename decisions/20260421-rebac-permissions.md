# Relationship-Based Access Control for Upload Permissions

## The Context

Zone servers and the backend need to decide whether a given user may upload an asset or perform a privileged action. The decision depends not on a fixed role but on the graph of relationships the user belongs to — a group member inherits the group's permissions, a group can itself be a member of another group, and so on transitively. Flat role tables cannot express this without enumerating every inherited edge explicitly.

## The Problem Statement

Role-based access control requires a separate row for every (user, permission) pair that inheritance would otherwise cover. As the group graph grows, maintaining that enumeration becomes inconsistent. A relationship graph that is evaluated at request time gives correct transitive answers without requiring any denormalized state to be kept up to date.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

`taskweft` is a C++20 NIF (Native Implemented Function) that exposes a relationship graph to the Elixir runtime. Edges are typed; the only edge type currently used is `IS_MEMBER_OF`. A user is a member of a group if there exists a path of `IS_MEMBER_OF` edges from the user node to the group node.

On each request that requires a permission check, the backend builds the graph from the `UserPrivilegeRuleset` record associated with the target resource and calls `check_rel/4`:

```elixir
check_rel(graph, subject_id, :IS_MEMBER_OF, object_id)
```

The function returns `true` if any path exists and `false` otherwise. No graph state is retained between requests; the NIF tears the structure down after the call returns. This means there is no cache invalidation problem and no persistent state that can diverge from the database.

The NIF is verified with PropCheck property tests. 93 properties cover path existence, absence, cycles, and transitivity invariants.

## The Benefits

Transitive group membership is evaluated correctly without maintaining denormalized ACL rows. Adding a user to a group immediately takes effect on the next request without any cache flush. The stateless per-request evaluation model is easy to reason about and test.

## The Downsides

Rebuilding the graph from the database on every request adds a query per check. For upload endpoints where permission checks are infrequent relative to the upload itself, this cost is acceptable. It would not be acceptable on a hot read path.

The NIF crashes the BEAM VM if it panics. The implementation uses PropCheck-verified invariants to reduce the risk, but a C++ memory error in the NIF is fatal to the node rather than to the calling process.

## The Road Not Taken

Storing a denormalized ACL table (user × permission) alongside the group graph would avoid the per-request graph build. The denormalized table requires a write on every group membership change, and membership changes that happen mid-request can produce inconsistent reads. The per-request approach avoids this class of inconsistency entirely.

## The Infrequent Use Case

A user who belongs to a deep chain of nested groups (depth > 10) will trigger a correspondingly deep traversal. The current implementation does not impose a depth limit; the PropCheck suite tests chains up to depth 20 without regression.

## In Core and Done by Us

`taskweft` is a standalone C++20 NIF repository. It is loaded by `multiplayer-fabric-zone-backend` at startup. `Uro.VSekai.check_upload_permission/2` is the primary call site.

## Status

Status: Accepted

## Decision Makers

- iFire

## Tags

- ReBAC, Permissions, NIF, taskweft, Access Control, Elixir, C++20
