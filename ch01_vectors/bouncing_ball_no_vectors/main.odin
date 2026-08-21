/*
Implementation note:
The two DrawCircleLines approach has reached its limits for this sketch.
So I decided to deviate from a slightly stricter port to using DrawRing
and enabling MSAA.
*/

package bouncing_ball_no_vectors

/*
Example 1.1: Bouncing Ball with No Vectors
https://natureofcode.com/vectors/#example-11-bouncing-ball-with-no-vectors
*/

import rl "vendor:raylib"

WIDTH :: 640
HEIGHT :: 240

main :: proc() {
    rl.SetConfigFlags({.MSAA_4X_HINT})
    rl.InitWindow(WIDTH, HEIGHT, "example 1.1")
    rl.SetTargetFPS(60)

    x: f32 = 100
    y: f32 = 100
    xspeed: f32 = 2.5
    yspeed: f32 = 2

    for !rl.WindowShouldClose() {
        x = x + xspeed
        y = y + yspeed

        if x > f32(WIDTH) || x < 0 {
            xspeed *= -1
        }
        if y > f32(HEIGHT) || y < 0 {
            yspeed *= -1
        }

        rl.BeginDrawing()
        defer rl.EndDrawing()
        rl.ClearBackground(rl.WHITE)
        rl.DrawCircle(i32(x), i32(y), 24, rl.Color{127, 127, 127, 255})
        rl.DrawRing({x, y}, 23.5, 25.0, 0, 360, 64, rl.BLACK)
    }
    rl.CloseWindow()
}