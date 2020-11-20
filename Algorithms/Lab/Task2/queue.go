package main

import "fmt"

type Queue struct {
	items   []int
	maxSize int
	head    int
	tail    int
}

func newQueue(size int) Queue {
	size += 1

	return Queue{
		items:   make([]int, size),
		maxSize: size,
		head:    0,
		tail:    0,
	}
}

func (q Queue) Size() int {
	if q.head <= q.tail {
		return q.tail - q.head
	}
	return q.maxSize - q.head + q.tail
}

func (q Queue) IsEmpty() bool {
	return q.head == q.tail
}

func (q Queue) IsFull() bool {
	return (q.tail+1)%q.maxSize == q.head
}

func (q Queue) ToSlice() []int {
	arr := []int{}

	i := q.head
	for i != q.tail {
		arr = append(arr, q.items[i])

		i = (i + 1) % q.maxSize
	}

	return arr
}

func (q Queue) Peek() int {
	return q.items[q.head]
}

func (q *Queue) Enqueue(n int) {
	if q.IsFull() {
		return
	}

	q.items[q.tail] = n
	q.tail = (q.tail + 1) % q.maxSize
}

func (q *Queue) Dequeue() int {
	if q.IsEmpty() {
		return 0
	}

	item := q.items[q.head]
	q.head = (q.head + 1) % q.maxSize

	return item
}

func (q Queue) Info() {
	fmt.Println("\n--- Queue info ---")
	fmt.Println("Content:", q.ToSlice())
	fmt.Println("Size:", q.Size())
	fmt.Println("Is empty:", q.IsEmpty())
	fmt.Println("Is full:", q.IsFull())
	fmt.Printf("------------------\n\n")
}
