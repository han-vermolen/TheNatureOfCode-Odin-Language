package gaussian_distribution

/*
Example 0.4: A Gaussian Distribution
https://natureofcode.com/random/#example-04-a-gaussian-distribution
*/

import "core:math/rand"
import rl "vendor:raylib"

WIDTH :: 640
HEIGHT :: 240

main :: proc() {
    rl.InitWindow(WIDTH, HEIGHT, "Example 0.4")
    rl.SetTargetFPS(60)

    canvas := rl.LoadRenderTexture(WIDTH, HEIGHT)
    defer rl.UnloadRenderTexture(canvas)

    rl.BeginTextureMode(canvas)
    rl.ClearBackground(rl.WHITE)
    rl.EndTextureMode()

    for !rl.WindowShouldClose() {
        x := i32(rand.float32_normal(320, 60))

        rl.BeginTextureMode(canvas)
        rl.DrawCircle(x, 120, 8, rl.Color{ 0, 0, 0, 10 })
        rl.EndTextureMode()

        rl.BeginDrawing()
        defer rl.EndDrawing()

        rl.DrawTextureRec(
        canvas.texture,
        { 0, 0, f32(WIDTH), -f32(HEIGHT) },
        { 0, 0 },
        rl.WHITE,
        )
    }
    rl.CloseWindow()
}
