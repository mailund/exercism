open Base

type bst = Leaf | Node of int * bst * bst

let empty = Leaf

let value tree = 
  match tree with
  | Leaf -> Error "empty"
  | Node (v, _, _) -> Ok v

let left tree = 
  match tree with
  | Leaf -> Error "empty"
  | Node (_, l, _) -> Ok l

let right tree = 
  match tree with
  | Leaf -> Error "empty"
  | Node (_, _, r) -> Ok r

let insert i tree = 
  let rec insert' i tree = 
    match tree with
    | Leaf -> Node (i, Leaf, Leaf)
    | Node (v, l, r) -> 
      if i <= v then Node (v, insert' i l, r)
      else if i > v then Node (v, l, insert' i r)
      else Node (v, l, r)
  in insert' i tree

let to_list tree = 
  let rec to_list' tree = 
    match tree with
    | Leaf -> []
    | Node (v, l, r) -> (to_list' l) @ [v] @ (to_list' r)
  in to_list' tree

