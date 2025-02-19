open Base

let ( >>= ) x f = Result.bind x ~f
let ( >>| ) x f = Result.map x ~f

type nuc = A | C | G | T

let of_char (c : char) : (nuc, char) Result.t =
  match c with
  | 'A' -> Ok A
  | 'C' -> Ok C
  | 'G' -> Ok G
  | 'T' -> Ok T
  | _ -> Error c

let to_char (n : nuc) : char =
  match n with A -> 'A' | C -> 'C' | G -> 'G' | T -> 'T'

let nuc_eq (n1 : nuc) (n2 : nuc) : bool =
  match (n1, n2) with A, A | C, C | G, G | T, T -> true | _ -> false

let nuc_from_string (s : string) : (nuc list, char) Result.t =
  String.to_list s |> List.map ~f:of_char |> Result.all

let count_nuc (ns : nuc list) (n : nuc) : int = List.count ~f:(nuc_eq n) ns

let count_nucleotide (s : string) (c : char) : (int, char) Result.t =
  nuc_from_string s >>= fun ns ->
  of_char c >>= fun n -> Ok (count_nuc ns n)

let count_nucleotides s =
  let empty = Map.empty (module Char) in
  nuc_from_string s >>| fun ns ->
  List.fold ns ~init:empty ~f:(fun counts n ->
      Map.update counts (to_char n) ~f:(function None -> 1 | Some x -> x + 1))
