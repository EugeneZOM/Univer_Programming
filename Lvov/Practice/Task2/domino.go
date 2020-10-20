package main

type Domino struct {
  first, second int
}

func NewDomino(v1, v2 int) Domino {
  if v1 > v2 {
    v1, v2 = v2, v1
  }
  return Domino{v1, v2}
}
