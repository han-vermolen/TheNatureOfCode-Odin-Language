/*
Implementation note:
The core:math/noise package's noise_2d comes closest to the noise() function
used in the original example made with p5.js. However, it's not the same noise
as used by the book's code. Without explaining too deeply, the implementation
from the Odin package is actually a bit nicer. (less artifacting)

API differences that are noteworthy:
- P5.js returns a range of 0..1 while noise_2d returns one of -1..1.
    This is why the remap looks different than the map from
    the book's example code

- P5.js uses a global noiseSeed while noise_2d takes it as its first argument.

- Dimensions are different for P5.js than the minimal dimension
    needed for noise_xd in core:math/noise.
    P5.js allows just 1 dimension while odin's package needs at least 2.
    This is why we need the { w.tx, 0 } and {w.ty, 0}

It won't be pixel perfect, but it'll do the job.
*/

package perlin_noise_walk

/*
Example 0.6: A Perlin Noise Walker
https://natureofcode.com/random/#example-06-a-perlin-noise-walker
*/

import "core:math"
import "core:math/noise"
import rl "vendor:raylib"

WIDTH::640
HEIGHT::240

Walker::struct{
    x: f32,
    y: f32,
    tx: f64,
    ty: f64,
}

walker_init :: proc() -> Walker {
    return Walker{tx = 0, ty = 10000 }
}

walker_step :: proc(w: ^Walker) {
    w.x = math.remap(noise.noise_2d(2, {w.tx, 0}),
    -1.0,
    1.0,
    0.0,
    WIDTH)
    w.y = math.remap(noise.noise_2d(2, {w.ty, 0}),
    -1.0,
    1.0,
    0.0,
    HEIGHT)
    w.tx += 0.01
    w.ty += 0.01
}

main :: proc() {
    rl.InitWindow(WIDTH, HEIGHT, "example 0.6")
    rl.SetTargetFPS(60)
    walker := walker_init()

    canvas :=rl.LoadRenderTexture(WIDTH, HEIGHT)
    defer rl.UnloadRenderTexture(canvas)

    rl.BeginTextureMode(canvas)
    rl.ClearBackground(rl.Color{ 0, 0, 0, 0 })
    rl.EndTextureMode()

    for !rl.WindowShouldClose(){
        walker_step(&walker)

        rl.BeginTextureMode(canvas)
        rl.DrawCircle(i32(walker.x), i32(walker.y),
        24, rl.Color{ 127, 127, 127, 255 })
        rl.DrawCircleLines(i32(walker.x), i32(walker.y),
        24, rl.BLACK)
        rl.DrawCircleLines(i32(walker.x), i32(walker.y),
        23, rl.BLACK)
        rl.EndTextureMode()

        rl.BeginDrawing()
        defer rl.EndDrawing()
        rl.ClearBackground(rl.WHITE)

        rl.DrawTextureRec(
        canvas.texture,
        { 0, 0, f32(WIDTH), -f32(HEIGHT) },
        { 0, 0 },
        rl.WHITE,
        )
    }
    rl.CloseWindow()
}