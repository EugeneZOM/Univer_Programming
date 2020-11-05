package main

import (
	"fmt"
	"math"
)

//const Epsilon = (0.5 * math.Pow(10, -6))

func formula(x float64) float64 {
	//return math.Pow(x, 3) - 3 * math.Pow(x, 2) + 6 * x - 2	// #13
	return math.Sin(x)
}

func findResultsInRange(start, end, step float64) []float64 {
	results := []float64{}

	for x := start; x <= end; x += step {
		results = append(results, formula(float64(x)))
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

func dihotomie(a, b float64) float64 {
	return 0.0
}

func main() {
	start, end, step := -5.0, 5.0, 1.0

	fmt.Println("Start:", start)
	fmt.Println("End:", end)
	fmt.Println("Step:", step)

	// Get results
	results := findResultsInRange(start, end, step)
	fmt.Println("Results:", results)

	// Find x of results with different signs
	pairs := findXofResultsWithDifferentSigns(results, start, end, step)
	fmt.Println("Different signs between (x1, x2):", pairs)

	if len(pairs) == 0 {
		fmt.Println("No results")
		return
	}

	// Get more accuracy ranges
	for i := 0; i < len(pairs); i++ {
		x1, x2 := pairs[i][0], pairs[i][1]
		step := 0.1

		results := findResultsInRange(x1, x2, step)
		pairs2 := findXofResultsWithDifferentSigns(results, x1, x2, step)

		if len(pairs2) > 0 {
			pairs[i] = pairs2[0]
		}
	}

	fmt.Println("More accuracy:", pairs)
}