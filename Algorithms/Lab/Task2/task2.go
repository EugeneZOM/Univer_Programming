package main

import (
	"fmt"
	"math/rand"
)

func Task2() {
	sl := initRandomStackList(10)

	sl.Info()

	// Find min
	minVal, minIndex := findMinInStackList(&sl)
	fmt.Println("Min value:", minVal)
	fmt.Println("Min index:", minIndex)

	// Remove min
	sl.Remove(minIndex)

	sl.Info()
}

func initRandomStackList(size int) StackList {
	sl := NewStackList()

	for i := 0; i < size; i++ {
		sl.Push(rand.Intn(100))
	}

	return sl
}

func findMinInStackList(sl *StackList) (int, int) {
	val, index := sl.Get(0), 0

	for i := 0; i < sl.Size(); i++ {
		item := sl.Get(i)

		if item < val {
			val, index = item, i
		}
	}

	return val, index
}
