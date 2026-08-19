package accept_reject_distribution

/*
Example 0.5: An Accept-Reject Distribution
https://natureofcode.com/random/#example-05-an-accept-reject-distribution
*/

import "core:math/rand"
import rl "vendor:raylib"

WIDTH :i32: 640
HEIGHT :i32: 240
TOTAL :  int : 20

main :: proc () {
    rl.InitWindow(WIDTH, HEIGHT, "example 0.5")
    rl.SetTargetFPS(60)

    random_counts : [TOTAL]i32 = { }
    w := WIDTH / len(random_counts)

    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        defer rl.EndDrawing()
        rl.ClearBackground(rl.WHITE)

        index := int(accept_reject() * len(random_counts))
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
    }
    rl.CloseWindow()
}

accept_reject :: proc() -> f32 {
    for {
        r1 := rand.float32()
        probability := r1
        r2 := rand.float32()
        if (r2 < probability) {
            return r1
        }
    }
}