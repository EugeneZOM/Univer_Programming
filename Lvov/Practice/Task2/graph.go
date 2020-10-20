package main

type Node int

type Graph struct {
  nodes []Node
  edges map[Node][]Node
}

func NewGraph() Graph {
  return Graph{
    []Node{},
    make(map[Node][]Node),
  }
}

func (g *Graph) Insert(n1, n2 Node) {
  // Remove self-joined edge
  if n1 == n2 {
    return
  }

  if g.edges[n1] == nil {
    g.nodes = append(g.nodes, n1)
    g.edges[n1] = []Node{}
  }
  if g.edges[n2] == nil {
    g.nodes = append(g.nodes, n2)
    g.edges[n2] = []Node{}
  }
  g.edges[n1] = append(g.edges[n1], n2)
  g.edges[n2] = append(g.edges[n2], n1)
}

func (g Graph) HasEulerPath() bool {
  if !g.IsConnected() {
    return false
  }
  oddAmount := 0

  for _, v := range g.edges {
    if len(v) % 2 == 1 {
      oddAmount++
    }
  }

  return oddAmount == 2
}

func (g Graph) IsConnected() bool {
  visited := make(map[Node]bool)

  queue := []Node{g.nodes[0]}
  for len(queue) > 0 {
    for _, node := range g.edges[queue[0]] {
      if !visited[node] {
        queue = append(queue, node)
      }
    }
    visited[queue[0]] = true
    queue = queue[1:]
  }

  return len(visited) == len(g.edges)
}
