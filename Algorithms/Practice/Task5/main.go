package main

import "fmt"

func factorialZerosAmount(n int) int {
  amount := 0

  for i := 5; n / i >= 1; i *= 5 {
    amount += n / i
  }

  return amount
}



// Precomputed data
var digits = [...]int{ 1, 1, 2, 6, 4, 2, 2, 4, 2, 8 }

// Returns last non 0 digit
func factorialLastDigit(n int) int {
  if n < 10 {
    return digits[n]
  }

  lastDigit := 0;
  k := 4

  if (n / 10) % 10 % 2 == 0 {
    k = 6
  }

  lastDigit = k * factorialLastDigit(n / 5) * digits[n % 10]

  return lastDigit % 10
}

func main() {
  n := 5

  amount := factorialZerosAmount(n)
  lastDigit := factorialLastDigit(n)

  fmt.Println("N:", n)
  fmt.Println("Zeros:", amount)
  fmt.Println("Last digit:", lastDigit)
}
