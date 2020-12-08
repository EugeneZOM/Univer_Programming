package main

import (
	"fmt"
	"math"
)

func Task(a, b, c float64) (float64, float64, bool) {
	// ax^2 + bx + c = 0
	D := b*b - 4.0*a*c

	A := 2 * a
	B := -b

	if D < 0 {
		// No solution
		return 0, 0, false
	} else if D == 0 {
		// One solution
		return B / A, B / A, true
	}

	d := float64(int(math.Sqrt(D)))
	E := D / (d * d)

	if B != 0 {
		if d != 1 {
			if A != 1 {
				fmt.Printf("(%f±%f√%f)/%f\n", B, d, E, A)
				return (B + (d * math.Sqrt(E))) / A, (B - (d * math.Sqrt(E))) / A, true
			} else {
				fmt.Printf("%f±%f√%f\n", B, d, E)
				return B + (d * math.Sqrt(E)), B - (d * math.Sqrt(E)), true
			}
		} else {
			if A != 1 {
				fmt.Printf("(%f±√%f)/%f\n", B, E, A)
				return (B + math.Sqrt(E)) / A, (B - math.Sqrt(E)) / A, true
			} else {
				fmt.Printf("%f±√%f\n", B, E)
				return B + math.Sqrt(E), B - math.Sqrt(E), true
			}
		}
	} else {
		if d != 1 {
			if A != 1 {
				fmt.Printf("±%f√%f/%f\n", d, E, A)
				return d * math.Sqrt(E) / A, -d * math.Sqrt(E) / A, true
			} else {
				fmt.Printf("±%f√%f\n", d, E)
				return d * math.Sqrt(E), -d * math.Sqrt(E), true
			}
		} else {
			if a != 1 {
				fmt.Printf("±√%f/%f\n", E, A)
				return math.Sqrt(E) / A, -math.Sqrt(E) / A, true
			} else {
				fmt.Printf("±√%f\n", E)
				return math.Sqrt(E), -math.Sqrt(E), true
			}
		}
	}
}

func main() {
	var a, b, c float64

	a, b, c = 2.0, -6.0, 4.0

	x1, x2, hasSolution := Task(a, b, c)

	if hasSolution {
		fmt.Printf("Solution: x1=%f x2=%f\n", x1, x2)
	} else {
		fmt.Println("No solution")
	}

}
