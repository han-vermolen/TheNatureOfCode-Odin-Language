package leaning_walk

/*
Example 0.3: A Walker That Tends to Move to the Right
*/

import "core:math/rand"
import rl "vendor:raylib"

WIDTH :: 640
HEIGHT :: 240

Walker :: struct {
    x: i32,
    y: i32,
}

walker_init :: proc() -> Walker {
    return Walker{x = (WIDTH / 2), y = (HEIGHT / 2)}
}

walker_move :: proc(w: ^Walker) {
    switch rand.float32() {
    case 0..<0.4:
        w.x += 1
    case 0.4..<0.6:
        w.x -= 1
    case 0.6..<0.8:
        w.y += 1
    case :
        w.y -= 1
    }
}

main :: proc() {
    rl.InitWindow(WIDTH, HEIGHT, "Example 0.3")
    rl.SetTargetFPS(60)
    walker := walker_init()

    canvas := rl.LoadRenderTexture(WIDTH, HEIGHT)
    defer rl.UnloadRenderTexture(canvas)

    for !rl.WindowShouldClose() {
        walker_move(&walker)

        rl.BeginTextureMode(canvas)
        rl.DrawPixel(walker.x, walker.y, rl.GREEN)
        rl.EndTextureMode()

        rl.BeginDrawing()
        defer rl.EndDrawing()

        rl.ClearBackground(rl.BLACK)
        rl.DrawTextureRec(
        canvas.texture,
        {0, 0, f32(WIDTH), -f32(HEIGHT)},
        {0, 0},
        rl.WHITE,
        )
    }
    rl.CloseWindow()
}
