package main

import (
	"fmt"
	"math/rand"
)

func Task3() {
	l := initRandomLinkedList(10)

	l.Info()

	// Find min
	minVal, minIndex := findMinInLinkedList(&l)
	fmt.Println("Min value:", minVal)
	fmt.Println("Min index:", minIndex)

	// Remove min
	l.Remove(minIndex)

	l.Info()
}

func initRandomLinkedList(size int) LinkedList {
	l := NewLinkedList()

	for i := 0; i < size; i++ {
		l.Push(rand.Intn(100))
	}

	return l
}

func findMinInLinkedList(l *LinkedList) (int, int) {
	val, index := l.Get(0), 0

	for i := 0; i < l.Size(); i++ {
		item := l.Get(i)

		if item < val {
			val, index = item, i
		}
	}

	return val, index
}
