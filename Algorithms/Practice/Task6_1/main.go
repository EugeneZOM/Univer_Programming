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
  m, n := 4, 3

  result := m + n - GCD(m, n)

  fmt.Println(result)
}
