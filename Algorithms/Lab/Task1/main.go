package main

import (
	"flag"
	"fmt"
	"math/rand"
	"time"
)

func generateSlice(size int) []int {
	return rand.Perm(size)
}

func checkSorted(nums []int) bool {
	for i := 0; i < len(nums)-1; i++ {
		if nums[i] > nums[i+1] {
			return false
		}
	}
	return true
}

func main() {
	rand.Seed(time.Now().Unix())

	sortType := flag.String("sort", "bubble", "set sort type")
	arrSize := flag.Int("n", 10, "array size")
	debug := flag.Bool("debug", false, "show debug info")
	flag.Parse()

	nums := generateSlice(*arrSize)

	if *debug {
		fmt.Println("Unsorted:", nums)
	}

	var sort func([]int)
	switch *sortType {
	case "bubble":
		sort = BubbleSort
	case "insertion":
		sort = InsertionSort
	case "quick":
		sort = QuickSort
	}

	startTime := time.Now()

	sort(nums)

	elapsedTime := float32(time.Since(startTime).Microseconds())

	if *debug {
		fmt.Println("Sorted:", nums)
	}

	if checkSorted(nums) {
		fmt.Println("Sorted")
	} else {
		fmt.Println("Nope")
	}

	fmt.Println("Time:", elapsedTime / 1000.0)
}