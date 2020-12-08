package main

import (
	"fmt"
)

func isInCantor(a, b, n int) bool {
	if a > b {
		return false
	}

	for i := 0; i < n; i++ {
		d := a * 3
		if d/b == 1 {
			return false
		}
		a = d % b
	}

	return true
}

func main() {
	var a, b, n int

	a, b, n = 2, 3, 5

	fmt.Printf("A=%d, B=%d, N=%d\n", a, b, n)
	fmt.Println("Is in cantor:", isInCantor(a, b, n))
}
