package main

import "fmt"

func Abs(n int) int {
  if n < 0 {
    return -n
  }
  return n
}

func GCD(a, b int) int {
  for b != 0 {
    a %= b
    if a == 0 {
      return Abs(b)
    }
    b %= a
  }
  return Abs(a)
}

func main() {
  k, m, n := 3, 4, 5

  result := k + m + n - (GCD(k, m) + GCD(k, n) + GCD(m, n)) + GCD(k, GCD(m, n))

  fmt.Println(result)
}
