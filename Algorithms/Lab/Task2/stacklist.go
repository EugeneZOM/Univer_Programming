package main

import "fmt"

type StackList struct {
	left, right  Stack
	size         int
	currentIndex int
}

func NewStackList() StackList {
	return StackList{
		left:         NewStack(),
		right:        NewStack(),
		size:         0,
		currentIndex: 0,
	}
}

func (sl StackList) IsEmpty() bool {
	return sl.size == 0
}

func (sl *StackList) Push(item int) {
	sl.left.Push(item)
	sl.size++
	sl.currentIndex++
}

func (sl *StackList) Get(pos int) int {
	if sl.IsEmpty() || pos < 0 || pos >= sl.Size() {
		return 0
	}

	move := sl.Next
	if sl.currentIndex > pos {
		move = sl.Prev
	}

	for sl.currentIndex != pos {
		move()
	}

	item := sl.right.Top()

	return item
}

func (sl *StackList) Remove(pos int) {
	if sl.IsEmpty() || pos < 0 || pos >= sl.Size() {
		return
	}

	sl.Get(pos)
	sl.right.Pop()
	sl.size--
}

func (sl *StackList) Next() {
	if sl.right.IsEmpty() {
		return
	}

	sl.left.Push(sl.right.Pop())
	sl.currentIndex++
}

func (sl *StackList) Prev() {
	if sl.left.IsEmpty() {
		return
	}

	sl.right.Push(sl.left.Pop())
	sl.currentIndex--
}

func (sl StackList) Size() int {
	return sl.size
}

func (sl StackList) Info() {
	fmt.Println("---------")
	fmt.Println("Size:", sl.Size())
	fmt.Println("Index:", sl.currentIndex)
	fmt.Println("Left:", sl.left)
	fmt.Println("Right:", sl.right)
	fmt.Println("---------")
}
