package main

import "fmt"

func main() {
  fib1, fib2, n := 1, 1, 2

  for fib2 > 0 {
    n++
    fib1, fib2 = fib2, (fib1 + fib2) % 10000
  }

  fmt.Println("Index:", n)
}
