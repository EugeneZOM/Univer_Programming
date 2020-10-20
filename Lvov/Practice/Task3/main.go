package main

import "fmt"

func QuickPow(a, n, d int) int {
	if n == 0 {
		return 1
	}

	r := QuickPow(a, n / 2, d)
	if n % 2 == 0 {
		return (r * r) % d
	}
	return (r * r * a) % d
}

func main() {
	var a, n int

	a, n = 2, 10

	/*
	15, 4 => 25
	6, 4 => 96
	2, 10 => 24
	*/

	fmt.Println("A:", a)
	fmt.Println("N:", n)
	fmt.Println("Result:", QuickPow(a, n, 100))
}