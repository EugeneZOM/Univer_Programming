package main

import (
	"flag"
	"fmt"
	"math/rand"
	"time"
)

var task = flag.Int("t", 1, "Subtask number")

func main() {
	flag.Parse()
	rand.Seed(time.Now().Unix())

	switch *task {
	case 1:
		Task1()
	case 2:
		Task2()
	case 3:
		Task3()
	default:
		fmt.Println("Incorrect subtask number")
	}
}
