package main

import "fmt"

func main() {
  dominos := []Domino{
    NewDomino(1, 2),
    NewDomino(1, 5),
    NewDomino(2, 5),
    NewDomino(0, 3),
    NewDomino(0, 4),
    NewDomino(3, 4),
    NewDomino(3, 6),
    NewDomino(4, 4),
    NewDomino(6, 4),
    NewDomino(5, 6),
  }
  /*dominos := []Domino{
    NewDomino(1, 2),
    NewDomino(2, 3),
    NewDomino(1, 5),
    NewDomino(5, 2),
    NewDomino(5, 4),
    NewDomino(2, 4),
    NewDomino(5, 3),
    NewDomino(4, 3),
  }*/

  fmt.Println("Dominos:", dominos)

  graph := NewGraph()

  // Load dominos into graph
  for _, d := range dominos {
    graph.Insert(Node(d.first), Node(d.second))
  }

  fmt.Println(graph)
  fmt.Println("Has path:", graph.HasEulerPath())
}
