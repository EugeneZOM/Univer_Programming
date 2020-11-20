package main

import (
	"fmt"
	"math/rand"
)

func Task1() {
	q := initRandomQueue(3)

	q.Info()

	// Find min
	minVal, minIndex := findMinInQueue(&q)
	fmt.Println("Min value:", minVal)
	fmt.Println("Min index:", minIndex)

	// Remove min
	removeByIndexInQueue(&q, minIndex)

	q.Info()
}

func initRandomQueue(size int) Queue {
	q := newQueue(size)

	for i := 0; i < size; i++ {
		q.Enqueue(rand.Intn(100))
	}

	return q
}

func findMinInQueue(q *Queue) (int, int) {
	val, index := q.Peek(), 0

	for i := 0; i < q.Size(); i++ {
		item := q.Dequeue()
		q.Enqueue(item)

		if item < val {
			val, index = item, i
		}
	}

	return val, index
}

func removeByIndexInQueue(q *Queue, index int) {
	size := q.Size()

	if index >= size {
		return
	}

	for i := 0; i < size; i++ {
		item := q.Dequeue()

		if i != index {
			q.Enqueue(item)
		}
	}
}
