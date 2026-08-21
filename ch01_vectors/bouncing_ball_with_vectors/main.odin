package bouncing_ball_with_vectors

/*
Example 1.2: Bouncing Ball with Vectors!
https://natureofcode.com/vectors/#example-12-bouncing-ball-with-vectors
*/

import rl "vendor:raylib"

WIDTH :: 640
HEIGHT :: 240

main :: proc() {
	rl.SetConfigFlags({.MSAA_4X_HINT})
	rl.InitWindow(WIDTH, HEIGHT, "example 1.2")
	rl.SetTargetFPS(60)

	position: rl.Vector2 = {100, 100}
	velocity: rl.Vector2 = {2.5, 2}

	for !rl.WindowShouldClose() {

		position += velocity

		if position.x > WIDTH || position.x < 0 {
			velocity.x *= -1
		}
		if position.y > HEIGHT || position.y < 0 {
			velocity.y *= -1
		}

		rl.BeginDrawing()
		defer rl.EndDrawing()
		rl.ClearBackground(rl.WHITE)
		rl.DrawCircleV(position, 24, rl.Color{127, 127, 127, 255})
		rl.DrawRing(position, 23.5, 25.0, 0, 360, 64, rl.BLACK)
	}
	rl.CloseWindow()
}
