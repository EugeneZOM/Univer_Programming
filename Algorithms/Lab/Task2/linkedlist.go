package main

import (
	"fmt"
)

type Node struct {
	data int
	next *Node
	prev *Node
}

type LinkedList struct {
	node         *Node
	size         int
	currentIndex int
}

func NewLinkedList() LinkedList {
	return LinkedList{
		node:         nil,
		size:         0,
		currentIndex: 0,
	}
}

func (l LinkedList) IsEmpty() bool {
	return l.Size() == 0
}

func (l LinkedList) Size() int {
	return l.size
}

func (l *LinkedList) Push(item int) {
	l.MoveToEnd()
	prev := l.node
	node := NewNode(item, nil, prev)

	if l.node == nil {
		l.node = node
	} else {
		l.node.next = node
	}

	l.size++
}

func (l *LinkedList) Get(pos int) int {
	if pos < 0 || pos >= l.Size() {
		return 0
	}

	move := l.Next
	if pos < l.currentIndex {
		move = l.Prev
	}

	for l.currentIndex != pos {
		move()
	}

	item := l.node.Get()

	return item
}

func (l *LinkedList) Remove(pos int) {
	if pos < 0 || pos >= l.Size() {
		return
	}

	move := l.Next
	if pos < l.currentIndex {
		move = l.Prev
	}

	for l.currentIndex != pos {
		move()
	}

	next, prev := l.node.next, l.node.prev

	if next != nil {
		next.prev = prev
	}
	if prev != nil {
		prev.next = next
	}
}

func (l *LinkedList) Next() {
	if !l.IsEmpty() && l.node.next != nil {
		l.node = l.node.next
		l.currentIndex++
	}
}

func (l *LinkedList) Prev() {
	if !l.IsEmpty() && l.node.prev != nil {
		l.node = l.node.prev
		l.currentIndex--
	}
}

func (l *LinkedList) MoveToEnd() {
	if l.IsEmpty() {
		return
	}

	for l.node.next != nil {
		l.Next()
	}
}

func (l LinkedList) Info() {
	items := []int{}
	startNode := l.node

	for startNode.prev != nil {
		startNode = startNode.prev
	}

	for startNode.next != nil {
		items = append(items, startNode.Get())
		startNode = startNode.next
	}
	items = append(items, startNode.Get())

	fmt.Println("----------")
	fmt.Println(l)
	fmt.Println("Size:", l.Size())
	fmt.Println("Items:", items)
	fmt.Println("----------")
}

func NewNode(item int, next, prev *Node) *Node {
	return &Node{
		data: item,
		next: next,
		prev: prev,
	}
}

func (n Node) Get() int {
	return n.data
}
