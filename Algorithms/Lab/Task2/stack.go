package main

import (
	"fmt"
	"strconv"
)

type StackNode struct {
	data int
	next *StackNode
}

type Stack struct {
	data *StackNode
	size int
}

func NewStack() Stack {
	return Stack{
		data: nil,
		size: 0,
	}
}

func (s Stack) IsEmpty() bool {
	return s.size == 0
}

func (s *Stack) Push(item int) {
	s.data = NewStackNode(item, s.data)
	s.size++
}

func (s *Stack) Pop() int {
	if s.IsEmpty() {
		return 0
	}

	item := s.data.Get()
	s.data = s.data.Next()
	s.size--

	return item
}

func (s Stack) Top() int {
	if s.IsEmpty() {
		return 0
	}

	item := s.data.Get()

	return item
}

func (s Stack) GetSize() int {
	return s.size
}

func (s Stack) String() string {
	d := ""

	if s.data != nil {
		d = s.data.String()
	}

	return fmt.Sprintf("{{%s} %d}", d, s.GetSize())
}

func NewStackNode(item int, next *StackNode) *StackNode {
	return &StackNode{
		data: item,
		next: next,
	}
}

func (sn StackNode) Get() int {
	return sn.data
}

func (sn StackNode) Next() *StackNode {
	return sn.next
}

func (sn StackNode) String() string {
	str := strconv.Itoa(sn.Get())

	if sn.Next() != nil {
		str = sn.Next().String() + " " + str
	}

	return str
}
