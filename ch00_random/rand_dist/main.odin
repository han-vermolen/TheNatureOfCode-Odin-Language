package rand_dist

import "core:math/rand"
import rl "vendor:raylib"

WIDTH :  i32 : 640
HEIGHT : i32 : 240
TOTAL :  int : 20

main :: proc() {
    rl.InitWindow(WIDTH, HEIGHT, "Example 0.2")
    // p5.js works at 60 FPS. Mimic that here.
    rl.SetTargetFPS(60)

    random_counts : [TOTAL]i32 = { }
    w := WIDTH / len(random_counts)

    for !rl.WindowShouldClose(){
        rl.BeginDrawing()
        rl.ClearBackground(rl.WHITE)

        index := rand.int_max(TOTAL)
        random_counts[index] += 1
        for count, x in random_counts {
        /* Deviation from the book:
        The book uses w - 1 for the width of the bars,
        but that does not give the same visual
        effect as a gap appears between the bars.
        */
            rl.DrawRectangle(i32(x) * w,
            HEIGHT - count,
            w,
            count,
            rl.Color{ 127, 127, 127, 255 })

            rl.DrawRectangleLines(i32(x) * w,
            HEIGHT - count,
            w,
            count,
            rl.BLACK)
        }
        defer rl.EndDrawing()
    }
    rl.CloseWindow()
}