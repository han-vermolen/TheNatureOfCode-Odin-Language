# Roadmap

This tracks the plan for porting *The Nature of Code* (2nd ed.) to Odin +
Raylib. It follows the book's chapters **in order, none skipped, none
merged** — every chapter (0–11) gets its own lesson below. The only
additions are two clearly-marked **interludes**: short detours to pick up
Odin mechanics (growing collections, allocators) that the book doesn't
teach because Processing/p5.js don't need them. Interludes don't replace or
stand in for a book chapter.

For the full per-chapter example/exercise listing this was built from, see
[**The Nature of Code**](https://natureofcode.com/).

Status is tracked per sketch, not per lesson — a lesson is "done" when all
its sketches are. Update the status column as we go; this file should
always reflect current reality, not the original plan.

**Status legend:** ⬜ not started · 🟨 in progress · ✅ done · ⏸️ deferred

---

## Lesson 1 — Chapter 0: Randomness

New surface: `::` vs `:=`, `proc`, `struct`, `[2]f32`, `defer`, `^T`, `core:math/rand`

No vectors yet in this chapter — `x`, `y` as separate floats, matching the
book's own sequencing (vectors arrive in ch. 1).

| Sketch                                 | Package                          | Status |
|----------------------------------------|----------------------------------|--------|
| 0.1: Traditional Random Walk           | `ch00_random/walk`               | ✅       |
| 0.2: A Random-Number Distribution      | `ch00_random/rand_dist`          | ✅       |
| 0.3: Walker Biased Right               | `ch00_random/leaning_walker`     | ✅       |
| 0.4: Gaussian Distribution (histogram) | `ch00_random/gaussian_dist`      | ⬜     |
| 0.5: An Accept-Reject Distribution     | `ch00_random/accept_reject_dist` | ⬜     |
| 0.6: Perlin Noise Walker               | `ch00_random/noise_walk`         | ⬜     |

Extra practice pool (exercises 0.1–0.10): see reference doc.

## Lesson 2 — Chapter 1: Vectors

New surface: `[2]f32`, `core:math/linalg` (length, normalize, sub, mult)

| Sketch | Package | Status |
|---|---|---|
| 1.2 Bouncing Ball with Vectors | `ch01_vectors/bounce` | ⬜ |
| 1.3–1.6 Vector Subtraction / Multiply / Magnitude / Normalize (playground) | `ch01_vectors/vector_ops` | ⬜ |
| 1.7 Motion 101 (velocity) | `ch01_vectors/motion_velocity` | ⬜ |
| 1.8 Motion 101 (velocity + constant acceleration) | `ch01_vectors/motion_accel` | ⬜ |
| 1.9 Motion 101 (velocity + random acceleration) | `ch01_vectors/motion_random_accel` | ⬜ |
| 1.10 Accelerating Toward the Mouse | `ch01_vectors/motion_mouse` | ⬜ |

Extra practice pool (exercises 1.1–1.8): see reference doc.

## Interlude — Many movers (not a book chapter)

New surface: `[dynamic]T`, slices, `for &m in movers`, `delete`

The book grows from one `Mover` to many implicitly across later chapters
(e.g. 2.7 "Attraction, Many Movers") without ever teaching the mechanics of
a growable collection — Processing/p5 arrays don't need explaining. This
interlude exists purely to practice `[dynamic]T` before ch. 2 needs it for
real, not to cover book content.

| Sketch | Package | Status |
|---|---|---|
| Array of independent Movers (extends 1.9 to many) | `interlude_movers/many_movers` | ⬜ |

## Lesson 3 — Chapter 2: Forces

New surface: procedures over collections, mass/drag, `apply_force`

| Sketch | Package | Status |
|---|---|---|
| 2.1 Forces | `ch02_forces/forces` | ⬜ |
| 2.2 Forces on Two Objects | `ch02_forces/two_objects` | ⬜ |
| 2.3 Gravity Scaled by Mass | `ch02_forces/gravity_mass` | ⬜ |
| 2.4 Friction | `ch02_forces/friction` | ⬜ |
| 2.5 Fluid Resistance | `ch02_forces/fluid_resistance` | ⬜ |
| 2.6 Attraction | `ch02_forces/attraction` | ⬜ |
| 2.7 Attraction, Many Movers | `ch02_forces/attraction_many` | ⬜ |
| 2.8 Two-Body Attraction | `ch02_forces/two_body` | ⬜ |
| 2.9 N Bodies | `ch02_forces/n_bodies` | ⬜ |

Extra practice pool (exercises 2.1–2.16): see reference doc.

## Lesson 4 — Chapter 3: Oscillation

New surface: `core:math` trig (`sin`, `cos`, `atan2`), radians, angular
velocity/acceleration

| Sketch | Package | Status |
|---|---|---|
| 3.1 Angular Motion | `ch03_oscillation/angular_motion` | ⬜ |
| 3.2 Forces + Angular Motion | `ch03_oscillation/forces_angular` | ⬜ |
| 3.3 Pointing in Direction of Motion (atan2) | `ch03_oscillation/point_direction` | ⬜ |
| 3.4 Polar to Cartesian | `ch03_oscillation/polar_to_cartesian` | ⬜ |
| 3.5 Simple Harmonic Motion I | `ch03_oscillation/shm_1` | ⬜ |
| 3.6 Simple Harmonic Motion II (angular velocity) | `ch03_oscillation/shm_2` | ⬜ |
| 3.7 Oscillator Objects | `ch03_oscillation/oscillator_objects` | ⬜ |
| 3.8 Static Wave | `ch03_oscillation/static_wave` | ⬜ |
| 3.9 The Wave (animated) | `ch03_oscillation/wave` | ⬜ |
| 3.10 Spring Connection (Hooke's law) | `ch03_oscillation/spring` | ⬜ |
| 3.11 Swinging Pendulum | `ch03_oscillation/pendulum` | ⬜ |

Extra practice pool (exercises 3.1–3.17): see reference doc.

## Interlude — Allocators (not a book chapter)

New surface: `context`, arena, `temp_allocator`, frame-scratch idiom

Placed here, right before Particle Systems, because that's the first
chapter where objects are created and destroyed continuously at runtime —
the first place allocation patterns actually matter.

| Topic | Status |
|---|---|
| `context.allocator` vs `context.temp_allocator` | ⬜ |
| Arena allocator walkthrough | ⬜ |
| `free_all(context.temp_allocator)` frame idiom | ⬜ |

## Lesson 5 — Chapter 4: Particle Systems

New surface: `#soa`, union/variant for particle kinds, benchmarking

| Sketch | Package | Status |
|---|---|---|
| 4.1 Single Particle | `ch04_particles/single_particle` | ⬜ |
| 4.2 Array of Particles | `ch04_particles/array_particles` | ⬜ |
| 4.3 Single Emitter | `ch04_particles/emitter` | ⬜ |
| 4.4 System of Systems | `ch04_particles/system_of_systems` | ⬜ |
| 4.5 Inheritance/Polymorphism (mixed particle types) — Odin: union/variant, not inheritance | `ch04_particles/particle_kinds` | ⬜ |
| 4.6 Particle System with Forces | `ch04_particles/forces` | ⬜ |
| 4.7 Particle System with a Repeller | `ch04_particles/repeller` | ⬜ |
| 4.8 Image-Texture Particles | `ch04_particles/textured` | ⬜ |
| 4.9 Additive Blending | `ch04_particles/additive_blend` | ⬜ |
| `#soa` rewrite + before/after benchmark (our own addition, not in book) | `ch04_particles/particle_soa` | ⬜ |

Extra practice pool (exercises 4.1–4.14): see reference doc.

## Lesson 6 — Chapter 5: Autonomous Agents

New surface: steering (desired velocity − velocity), spatial hashing once
naive flocking gets slow

| Sketch | Package | Status |
|---|---|---|
| 5.1 Seeking a Target | `ch05_agents/seek` | ⬜ |
| 5.2 Arriving | `ch05_agents/arrive` | ⬜ |
| 5.3 Stay Within Walls | `ch05_agents/stay_within_walls` | ⬜ |
| 5.4 Flow-Field Following | `ch05_agents/flow_field` | ⬜ |
| 5.5–5.8 Path Object / Simple / Multi-Segment / Path Following | `ch05_agents/path_following` | ⬜ |
| 5.9 Separation | `ch05_agents/separation` | ⬜ |
| 5.10 Combined Seek + Separate | `ch05_agents/seek_separate` | ⬜ |
| Full flocking (separation + alignment + cohesion, per chapter text) | `ch05_agents/flock` | ⬜ |
| Flocking with spatial hash (naive O(n²) → grid, our own addition) | `ch05_agents/flock_spatial_hash` | ⬜ |

Extra practice pool (exercises 5.1–5.14): see reference doc.

## Lesson 7 — Chapter 6: Physics Libraries

New surface: **reinterpreted, not ported.** The book's examples (6.1–6.10)
bind Matter.js and Toxiclibs.js directly — neither has an Odin binding, and
there's nothing in the vendor:raylib package that replaces them. Rather
than skip the chapter, we build the underlying concepts from scratch:
Verlet or semi-implicit-Euler integration, simple constraints (distance,
pin), naive collision detection/response. This is a bigger lesson than most
— flag it for re-scoping once we get here.

| Concept (from ch. 6) | Sketch | Status |
|---|---|---|
| Bodies + integration (analogue of 6.1–6.3) | `ch06_physics/bodies_integration` | ⏸️ |
| Distance constraint (analogue of 6.6 pendulum / 6.7 windmill) | `ch06_physics/distance_constraint` | ⏸️ |
| Mouse constraint (analogue of 6.8) | `ch06_physics/mouse_constraint` | ⏸️ |
| Attraction within the custom engine (analogue of 6.9) | `ch06_physics/attraction` | ⏸️ |
| Collision events (analogue of 6.10) | `ch06_physics/collision_events` | ⏸️ |

## Lesson 8 — Chapter 7: Cellular Automata

New surface: 2D arrays/grids, possibly `#soa` grids

| Sketch | Package | Status |
|---|---|---|
| 7.1 Wolfram Elementary CA | `ch07_ca/elementary` | ⏸️ |
| 7.2 Game of Life | `ch07_ca/game_of_life` | ⏸️ |
| 7.3 OO Game of Life → Odin: struct-of-cells, not OO | `ch07_ca/game_of_life_cells` | ⏸️ |

Extra practice pool (exercises 7.1–7.14): see reference doc.

## Lesson 9 — Chapter 8: Fractals

New surface: recursion in Odin (stack behavior, no TCO guarantee — worth
checking), `core:math` trig

| Sketch | Package | Status |
|---|---|---|
| 8.1–8.3 Recursive Circles | `ch08_fractals/recursive_circles` | ⏸️ |
| 8.4 Cantor Set | `ch08_fractals/cantor_set` | ⏸️ |
| 8.5 Koch Curve | `ch08_fractals/koch_curve` | ⏸️ |
| 8.6 Recursive Tree | `ch08_fractals/tree` | ⏸️ |
| 8.7 Stochastic Tree | `ch08_fractals/tree_stochastic` | ⏸️ |
| 8.8 Simple L-system Sentence Generator | `ch08_fractals/lsystem_sentence` | ⏸️ |
| 8.9 An L-system | `ch08_fractals/lsystem` | ⏸️ |

Extra practice pool (exercises 8.1–8.13): see reference doc.

## Lesson 10 — Chapter 9: Evolutionary Computing

New surface: bit/byte manipulation, function values (`proc()` as data)

| Sketch | Package | Status |
|---|---|---|
| 9.1 GA Evolving Shakespeare | `ch09_ga/evolving_shakespeare` | ⏸️ |
| 9.2 Smart Rockets | `ch09_ga/smart_rockets` | ⏸️ |
| 9.3 Smarter Rockets | `ch09_ga/smarter_rockets` | ⏸️ |

Extra practice pool (exercises 9.1–9.12): see reference doc.

## Lesson 11 — Chapter 10: Neural Networks

New surface: matrices, generics (`$T`)

| Sketch | Package | Status |
|---|---|---|
| 10.1 The Perceptron | `ch10_nn/perceptron` | ⏸️ |
| 10.2 Gesture Classifier — book uses ml5.js; no Odin ML library exists, so this is reinterpreted as a small hand-written MLP + backprop instead of a library binding | `ch10_nn/mlp_classifier` | ⏸️ |

Extra practice pool (exercises 10.1–10.7): see reference doc.

## Lesson 12 — Chapter 11: Neuroevolution

New surface: tying GA (lesson 10) + NN (lesson 11) together; likely the
biggest single sketch in the project

| Sketch | Package | Status |
|---|---|---|
| 11.1 Flappy Bird Clone | `ch11_neuroevolution/flappy_clone` | ⏸️ |
| 11.2 Flappy Bird + Neuroevolution | `ch11_neuroevolution/flappy_neuroevolution` | ⏸️ |
| 11.3 Smart Rockets + Neuroevolution | `ch11_neuroevolution/smart_rockets_neuroevolution` | ⏸️ |
| 11.4 Dynamic Neuroevolutionary Steering | `ch11_neuroevolution/dynamic_steering` | ⏸️ |
| 11.5 Bloop with Sensors | `ch11_neuroevolution/bloop_sensors` | ⏸️ |
| 11.6 Neuroevolutionary Ecosystem | `ch11_neuroevolution/ecosystem` | ⏸️ |

Extra practice pool (exercises 11.1–11.4): see reference doc.

---

## Notes

- Package names above are proposed, not final — adjust as sketches are
  actually created.
- `PROGRESS.md` is the short "currently on lesson N, sketch X" pointer;
  don't duplicate this table there.
- The two hardest-to-port chapters are ch. 6 (Physics Libraries — no
  library to bind, rebuilt from scratch) and the back half of ch. 10
  (Gesture Classifier — no ml5.js equivalent, rebuilt as a hand-written
  MLP). Both are still in scope, just reinterpreted rather than
  transliterated — flagged inline above.

## Use of AI
AI mostly generated this document.
