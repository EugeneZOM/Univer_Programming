package main

import "fmt"

/* Unsure Solution */

func Abs(a int) int {
	if a < 0 {
		return -a
	}
	return a
}

func Max(a, b int) int {
	if a > b {
		return a
	}
	return b
}

func ExtGCDMod(a, b int) (int, int, int) {
	p, q := 1, 0
	r, s := 0, 1

	for a != b {
		if a > b {
			a -= b
			p -= r
			q -= s
		} else {
			b -= a
			r -= p
			s -= q
		}
	}

	fmt.Println("ExtGCD:")
	fmt.Println("-", p, q)
	fmt.Println("-", r, s)

	/*if a != 0 {
		return Abs(b), p, q
	} else {
		return Abs(a), r, s
	}*/
	return Abs(b), p-1, s-1
}

func main() {
	a, b := 3, 7

	fmt.Println("A:", a)
	fmt.Println("B:", b)

	d, u, v := ExtGCDMod(a, b)
	if d != 1 {
		fmt.Println("No solution")
		return
	}

	/*
	2, 5 = 4
	3, 7 = 12
	3, 5 = 8
	*/

	ans := Max(u*a+v*b, 1)

	fmt.Println("Answer:", ans)
}