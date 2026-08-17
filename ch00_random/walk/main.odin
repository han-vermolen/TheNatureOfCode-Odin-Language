package walk

/*
This is the Random walk example 0.1 from the Nature of Code book.
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
	switch rand.int_max(4) {
	case 0:
		w.x += 1
	case 1:
		w.x -= 1
	case 2:
		w.y += 1
	case 3:
		w.y -= 1
	}
}

main :: proc() {
	rl.InitWindow(WIDTH, HEIGHT, "Example 0.1")
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
