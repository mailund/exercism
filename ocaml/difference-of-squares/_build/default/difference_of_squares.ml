let numbers n = (List.init n (fun x -> x + 1))

let square_of_sum n = 
    let sum = List.fold_left (+) 0 (numbers n) 
    in sum * sum

let sum_of_squares n =
    List.fold_left (fun acc x -> acc + x * x) 0 (numbers n)

let difference_of_squares n =
    square_of_sum n - sum_of_squares n
