# Rejected: Use view replication algorithm for multiplayer multirelay sync

- Status: rejected
- Deciders: V-Sekai,fire,
- Tags: V-Sekai,sync,view replication,

## Context and Problem Statement

See [replicate sync 100'000 entities using a solution](20221019-replicate-sync-100-000-entities.md).

## Describe the proposed option and how it helps to overcome the problem or limitation

V-Sekai could use viewstamp replication in the context of game entity interpolation of past and current state.

The key insight is everything is a keyframed animation that is nearest, linear or cubic interpolated.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

We assume we're using Godot Engine 4 with float is doubles.

1. Replicate pending property changes safely to a quorum of distributed replicas, then
2. interpolate property changes to the in-memory state.
   - Ignore p_time too far in the future or the past as the viewstamp limit.
   - T Animation::\_interpolate(const Vector\<TKey\<T>> &p_keys, double p_time, InterpolationType p_interp, bool p_loop_wrap, bool \*p_ok, bool p_backward) const
3. ACK to the client.

See also Linux io_uring (replacement for epoll).

Everything is an interpolation event or a property state. Want to fit datastructures into 128 bytes (2 CPU cache lines).

We reuse the create_property data structure as the state.

#### Work in progress data structure based on Tigerbeetle

Referencing https://github.com/tigerbeetledb/tigerbeetle/blob/main/docs/DESIGN.md#data-structures.

See `Variant bytes_to_var_with_objects (PackedByteArray bytes)` and `PackedByteArray var_to_bytes_with_objects (Variant variable)`.

##### create_property_interpolate

```zig
create_property_interpolate {
	       id: 16 bytes (128-bit)
   past_entity_id: 16 bytes (128-bit)
current_entity_id: 16 bytes (128-bit) [to allow interpolation between different entities]
	user_data: 16 bytes (128-bit) [optional, e.g. opaque third-party identifier to link
		this transfer (many-to-one) to an external entity]
	 reserved: 16 bytes (128-bit) [reserved, for accounting policy primitives]
       pending_id: 16 bytes (128-bit) [optional, required to post or void an existing but pending transfer]
	  timeout:  8 bytes (64-bit) [optional, required only for a pending transfer, a quantity of time,
		i.e. an offset in nanoseconds from timestamp]
	    shard:  4 bytes (32-bit) [required, to enforce isolation by ensuring that all transfers
		are between entities of the same shard]
	     code:  2 bytes (16-bit) [required, an opaque entity code describing the type
		of the interpolation, e.g. player, map, prop]
	    flags:  2 bytes (16-bit) [optional, to modify the usage of the reserved field and for future feature expansion.]
	    value:  n bytes (n-bit) [required, variant of the past property and current property,
		which must be the same for both properties. Uses var_to_bytes_with_objects.]
	timestamp:  8 bytes (64-bit) [reserved, assigned by the leader before journaling]
} = n bytes (n CPU cache lines)
```

##### create_property

```zig
   create_property {
	      id: 16 bytes (128-bit)
       user_data: 16 bytes (128-bit) [optional, opaque third-party identifier to link this account
		(many-to-one) to an external entity]
	reserved: 48 bytes (384-bit) [reserved for future accounting policy primitives]
	   shard:  4 bytes (32-bit) [required, to enforce isolation by ensuring that all transfers
		are between accounts of the same ledger]
	    code:  2 bytes (16-bit) [required, an opaque entity code describing the type
		of the interpolation, e.g. player, map, prop]
	   flags:  2 bytes (16-bit) [optional, net balance limits:
		e.g. debits_must_not_exceed_credits or credits_must_not_exceed_debits]
     past_interpolations_pending: n bytes (n-bit variant. Uses var_to_bytes_with_objects.)
      past_interpolations_posted: n bytes (n-bit variant. Uses var_to_bytes_with_objects.)
  current_interpolations_pending: n bytes (n-bit variant. Uses var_to_bytes_with_objects.)
   current_interpolations_posted: n bytes (n-bit variant. Uses var_to_bytes_with_objects.)
		       timestamp: 8 bytes ( 64-bit) [reserved]
} = n bytes (n CPU cache lines)
```

## Positive Consequences <!-- optional -->

- The code is based on robust view replication consensus algorithm theory.
- The playback of the state machine is deterministic.

## Negative Consequences <!-- optional -->

- Minimum of three relays.

## Option graveyard: <!-- same as above -->

- Option: Current V-Sekai replication
- Rejection Reason: Can't link servers

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Entity replication is not trivial.

## Is there a reason why this should be core and done by us?

We're doing the networking layer.

## References <!-- optional and numbers of links can vary -->

- [Add a multiplayer interface and visual nodes for SceneTree replication
  ](https://github.com/godotengine/godot-proposals/issues/3459)

- [LMAX Exchange Architecture](https://skillsmatter.com/skillscasts/5247-the-lmax-exchange-architecture-high-throughput-low-latency-and-plain-old-java)

LMAX (quote):

> 1. journal incoming events safely to disk, and
> 2. replicate to backup nodes, then
> 3. apply these events to the in-memory state, then
> 4. ACK to the client

- [Tigerbeetle design](https://github.com/tigerbeetledb/tigerbeetle/blob/main/docs/DESIGN.md#architecture)

Tigerbeetle uses viewstamp replication in the context of bank ledger credit and debit.

Tigerbeetle (quote):

> 1. replicate incoming events safely to a quorum of distributed replicas, then
> 2. apply these events to the in-memory state, then
> 3. ACK to the client

- [viewstamped-replication-made-famous](https://github.com/tigerbeetledb/viewstamped-replication-made-famous)
- [vr-revisited.pdf](https://pmg.csail.mit.edu/papers/vr-revisited.pdf)
- [TigerBeetle Discord server](https://discord.gg/uWCGp46uG5)
- [Cubic interpolation](https://docs.godotengine.org/en/latest/tutorials/math/interpolation.html)

## Interpolation function from Godot Engine 4

Note that this handles both nearest interpolation and cubic (with time) interpolation.

```c++
template <class T>
T Animation::_interpolate(const Vector<TKey<T>> &p_keys, double p_time, InterpolationType p_interp, bool p_loop_wrap, bool *p_ok, bool p_backward) const {
	int len = _find(p_keys, length) + 1; // try to find last key (there may be more past the end)

	if (len <= 0) {
		// (-1 or -2 returned originally) (plus one above)
		// meaning no keys, or only key time is larger than length
		if (p_ok) {
			*p_ok = false;
		}
		return T();
	} else if (len == 1) { // one key found (0+1), return it

		if (p_ok) {
			*p_ok = true;
		}
		return p_keys[0].value;
	}

	int idx = _find(p_keys, p_time, p_backward);

	ERR_FAIL_COND_V(idx == -2, T());

	bool result = true;
	int next = 0;
	real_t c = 0.0;
	// prepare for all cases of interpolation

	if (loop_mode == LOOP_LINEAR && p_loop_wrap) {
		// loop
		if (!p_backward) {
			// no backward
			if (idx >= 0) {
				if (idx < len - 1) {
					next = idx + 1;
					real_t delta = p_keys[next].time - p_keys[idx].time;
					real_t from = p_time - p_keys[idx].time;

					if (Math::is_zero_approx(delta)) {
						c = 0;
					} else {
						c = from / delta;
					}
				} else {
					next = 0;
					real_t delta = (length - p_keys[idx].time) + p_keys[next].time;
					real_t from = p_time - p_keys[idx].time;

					if (Math::is_zero_approx(delta)) {
						c = 0;
					} else {
						c = from / delta;
					}
				}
			} else {
				// on loop, behind first key
				idx = len - 1;
				next = 0;
				real_t endtime = (length - p_keys[idx].time);
				if (endtime < 0) { // may be keys past the end
					endtime = 0;
				}
				real_t delta = endtime + p_keys[next].time;
				real_t from = endtime + p_time;

				if (Math::is_zero_approx(delta)) {
					c = 0;
				} else {
					c = from / delta;
				}
			}
		} else {
			// backward
			if (idx <= len - 1) {
				if (idx > 0) {
					next = idx - 1;
					real_t delta = (length - p_keys[next].time) - (length - p_keys[idx].time);
					real_t from = (length - p_time) - (length - p_keys[idx].time);

					if (Math::is_zero_approx(delta)) {
						c = 0;
					} else {
						c = from / delta;
					}
				} else {
					next = len - 1;
					real_t delta = p_keys[idx].time + (length - p_keys[next].time);
					real_t from = (length - p_time) - (length - p_keys[idx].time);

					if (Math::is_zero_approx(delta)) {
						c = 0;
					} else {
						c = from / delta;
					}
				}
			} else {
				// on loop, in front of last key
				idx = 0;
				next = len - 1;
				real_t endtime = p_keys[idx].time;
				if (endtime > length) { // may be keys past the end
					endtime = length;
				}
				real_t delta = p_keys[next].time - endtime;
				real_t from = p_time - endtime;

				if (Math::is_zero_approx(delta)) {
					c = 0;
				} else {
					c = from / delta;
				}
			}
		}
	} else { // no loop
		if (!p_backward) {
			if (idx >= 0) {
				if (idx < len - 1) {
					next = idx + 1;
					real_t delta = p_keys[next].time - p_keys[idx].time;
					real_t from = p_time - p_keys[idx].time;

					if (Math::is_zero_approx(delta)) {
						c = 0;
					} else {
						c = from / delta;
					}
				} else {
					next = idx;
				}
			} else {
				idx = next = 0;
			}
		} else {
			if (idx <= len - 1) {
				if (idx > 0) {
					next = idx - 1;
					real_t delta = (length - p_keys[next].time) - (length - p_keys[idx].time);
					real_t from = (length - p_time) - (length - p_keys[idx].time);

					if (Math::is_zero_approx(delta)) {
						c = 0;
					} else {
						c = from / delta;
					}

				} else {
					next = idx;
				}
			} else {
				idx = next = len - 1;
			}
		}
	}

	if (p_ok) {
		*p_ok = result;
	}
	if (!result) {
		return T();
	}

	real_t tr = p_keys[idx].transition;

	if (tr == 0 || idx == next) {
		// don't interpolate if not needed
		return p_keys[idx].value;
	}

	if (tr != 1.0) {
		c = Math::ease(c, tr);
	}

	switch (p_interp) {
		case INTERPOLATION_NEAREST: {
			return p_keys[idx].value;
		} break;
		case INTERPOLATION_LINEAR: {
			return _interpolate(p_keys[idx].value, p_keys[next].value, c);
		} break;
		case INTERPOLATION_LINEAR_ANGLE: {
			return _interpolate_angle(p_keys[idx].value, p_keys[next].value, c);
		} break;
		case INTERPOLATION_CUBIC:
		case INTERPOLATION_CUBIC_ANGLE: {
			int pre = 0;
			int post = 0;
			if (!p_backward) {
				pre = idx - 1;
				if (pre < 0) {
					if (loop_mode == LOOP_LINEAR && p_loop_wrap) {
						pre = len - 1;
					} else {
						pre = 0;
					}
				}
				post = next + 1;
				if (post >= len) {
					if (loop_mode == LOOP_LINEAR && p_loop_wrap) {
						post = 0;
					} else {
						post = next;
					}
				}
			} else {
				pre = idx + 1;
				if (pre >= len) {
					if (loop_mode == LOOP_LINEAR && p_loop_wrap) {
						pre = 0;
					} else {
						pre = idx;
					}
				}
				post = next - 1;
				if (post < 0) {
					if (loop_mode == LOOP_LINEAR && p_loop_wrap) {
						post = len - 1;
					} else {
						post = 0;
					}
				}
			}

			real_t pre_t = 0.0;
			real_t to_t = 0.0;
			real_t post_t = 0.0;
			if (loop_mode == LOOP_LINEAR && p_loop_wrap) {
				pre_t = pre > idx ? -length + p_keys[pre].time - p_keys[idx].time : p_keys[pre].time - p_keys[idx].time;
				to_t = next < idx ? length + p_keys[next].time - p_keys[idx].time : p_keys[next].time - p_keys[idx].time;
				post_t = next < idx || post <= idx ? length + p_keys[post].time - p_keys[idx].time : p_keys[post].time - p_keys[idx].time;
			} else {
				pre_t = p_keys[pre].time - p_keys[idx].time;
				to_t = p_keys[next].time - p_keys[idx].time;
				post_t = p_keys[post].time - p_keys[idx].time;
			}

			if (p_interp == INTERPOLATION_CUBIC_ANGLE) {
				return _cubic_interpolate_angle_in_time(
						p_keys[pre].value, p_keys[idx].value, p_keys[next].value, p_keys[post].value, c,
						pre_t, to_t, post_t);
			}
			return _cubic_interpolate_in_time(
					p_keys[pre].value, p_keys[idx].value, p_keys[next].value, p_keys[post].value, c,
					pre_t, to_t, post_t);
		} break;
		default:
			return p_keys[idx].value;
	}

	// do a barrel roll
}
```

## Derivative License

Copyright (c) 2022 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
