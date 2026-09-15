/*
Implementation note:
The rlgl.Translatef(CENTER.x, CENTER.y, 0) is stricly not needed.
It mirrors the book's translate(width/2, height/2) so the port's structure matches the book's, at the cost of a per-vertex CPU transform.
*/

package vector_subtraction

/*
Example 1.3: Vector Subtraction
https://natureofcode.com/vectors/#example-13-vector-subtraction
*/

import rl "vendor:raylib"
import "vendor:raylib/rlgl"

WIDTH :: 640
HEIGHT :: 240

CENTER :: rl.Vector2{WIDTH / 2, HEIGHT / 2}

main :: proc() {
	rl.SetConfigFlags({.MSAA_4X_HINT})
	rl.InitWindow(WIDTH, HEIGHT, "example 1.3")
	defer rl.CloseWindow()
	rl.SetTargetFPS(60)

	for !rl.WindowShouldClose() {
		mouse := rl.GetMousePosition()

		rl.BeginDrawing()
		defer rl.EndDrawing()

		rl.ClearBackground(rl.WHITE)
		rl.DrawLineEx({0, 0}, mouse, 4, rl.LIGHTGRAY)
		rl.DrawLineEx({0, 0}, CENTER, 4, rl.LIGHTGRAY)

		mouse -= CENTER

		rlgl.PushMatrix()
		defer rlgl.PopMatrix()
		rlgl.Translatef(CENTER.x, CENTER.y, 0)
		rl.DrawLineEx({0, 0}, mouse, 4, rl.BLACK)

	}
}
