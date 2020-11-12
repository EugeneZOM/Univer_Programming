package main

import (
	"fmt"
	"math"
)

/* Thanks to my classmate */

var epsilon = 0.5 * math.Pow(10, -6)

func f(x float64) float64 {
	return math.Pow(x, 3) - 3 * math.Pow(x, 2) + 6 * x - 2	// #13
}

func df(x float64) float64 {
  return 3 * math.Pow(x, 2) - 6 * x + 6
}

func df_2(x float64) float64 {
  return 6 * x - 6
}


func findResultsInRange(start, end, step float64) []float64 {
	results := []float64{}

	for x := start; x <= end; x += step {
		results = append(results, f(float64(x)))
	}

	return results;
}

func findXofResultsWithDifferentSigns(results []float64, start, end, step float64) [][]float64 {
	pairs := [][]float64{}
	lastResult := results[0]
	x := start

	for _, r := range(results) {
		// If different signs
		if r * lastResult <= 0 && lastResult != 0 {
			pairs = append(pairs, []float64{ x - step, x })
		}

		lastResult = r
		x += step
	}

	return pairs
}

func dihotomieMethod(a, b float64) float64 {
  c := 0.0

  if f(a) * f(b) > 0 {
    fmt.Println("Wrong interval")
    return c
  }

  for math.Abs(b-a) > epsilon {
    c = (a + b) / 2.0

    if f(a) * f(c) > 0 {
      a = c
    } else {
      b = c
    }
  }

	return c
}

func newtonMethod(a, b float64) float64 {
  x, x0 := 0.0, 0.0

  if f(a) * f(b) > 0 {
    fmt.Println("Wrong interval")
    return x
  }

  if f(a) * df_2(a) > 0 {
    x0 = a
  } else {
    x0 = b
  }

  x = x0 - f(x0) / df(x0)

  for math.Abs(x0-x) > epsilon {
    x0 = x
    x = x0 - f(x0) / df(x0)
  }

	return x
}

func chordMethod(a, b float64) float64 {
  x, x0, c := 0.0, 0.0, 0.0

  if f(a) * f(b) > 0 {
    fmt.Println("Wrong interval")
    return x
  }

  if f(a) * df_2(a) < 0 {
    x0 = a
    c = b
  } else {
    x0 = b
    c = a
  }

  x = x0 - f(x0) * (c - x0) / (f(c) - f(x0))

  for math.Abs(x0 - x) > epsilon {
    x0 = x
    x = x0 - f(x0) * (c - x0) / (f(c) - f(x0))
  }

  return x
}

func combinedMethod(a, b float64) float64 {
  a0, b0, x, x0 := 0.0, 0.0, 0.0, 0.0

  if f(a) * f(b) > 0 {
    fmt.Println("Wrong interval")
    return x
  }

  if f(a) * df_2(a) > 0 {
    a0 = a
    b0 = b
  } else {
    a0 = b
    b0 = a
  }

  x0 = a0 - f(a0) / df(a0)
  x = b0 - f(a0) * (x0 - b0) / (f(x0) - f(a0))

  for math.Abs(x0 - x) > epsilon {
    a0 = x
    x0 = a0 - f(a0) / df(a0)
    x = b0 - f(a0) * (x0 - b0) / (f(x0) - f(a0))
  }

  return x
}

func iterationMethod(a, b float64) float64 {
  x, x0, l := 0.0, 0.0, 0.0

  if f(a) * f(b) > 0 {
    fmt.Println("Wrong interval")
    return x
  }

  if math.Abs(df(a)) > math.Abs(df(b)) {
    l = 1 / df(a)
  } else {
    l = 1 / df(b)
  }

  x0 = a

  for math.Abs(x0 - x) > epsilon {
    x0 = x
    x = x0 - l * f(x0)
  }

  return x
}

func main() {
	start, end, step := -5.0, 5.0, 1.0

	fmt.Println("Start:", start)
	fmt.Println("End:", end)
	fmt.Println("Step:", step)

	// Get results
	results := findResultsInRange(start, end, step)

	// Find x of results with different signs
	pairs := findXofResultsWithDifferentSigns(results, start, end, step)
	fmt.Println("Different signs between (x1, x2):", pairs)

  fmt.Println("")
  for _, p := range pairs {
    a, b := p[0], p[1]
    fmt.Printf("--- [%f, %f] ---\n", a, b)
    fmt.Println("- Dihotomie:", dihotomieMethod(a, b))
    fmt.Println("- Newton:", newtonMethod(a, b))
    fmt.Println("- Chord:", chordMethod(a, b))
    fmt.Println("- Combined:", combinedMethod(a, b))
    fmt.Println("- Iterations:", iterationMethod(a, b))
  }

  fmt.Println("\nEpsilon:", epsilon)
}
