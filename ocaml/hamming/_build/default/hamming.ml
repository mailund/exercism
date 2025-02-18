type nucleotide = A | C | G | T

let hamming_distance (xs: nucleotide list) (ys: nucleotide list) : (int, string) Result.t =
  match xs, ys with
  | [], _::_ -> Error "left strand must not be empty"
  | _::_, [] -> Error "right strand must not be empty"
  | _, _ ->
    let rec loop xs ys acc =
      match xs, ys with
      | [], [] -> Ok acc
      | x::xs, y::ys when x = y -> loop xs ys acc
      | x::xs, y::ys when x != y -> loop xs ys (acc + 1)
      | _, _ -> Error "left and right strands must be of equal length"
    in
    loop xs ys 0
