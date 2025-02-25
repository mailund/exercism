
let acronym s =
  s 
  |> String.to_seq
  |> Seq.filter (fun c -> c <> '\'')
  |> Seq.map (fun c -> if c = '-' || c = '_' then ' ' else c)
  |> String.of_seq
  |> String.split_on_char ' '
  |> List.filter (fun s -> String.length s > 0)
  |> List.map (fun s -> 
    Char.uppercase_ascii (String.get s 0) |> String.make 1
    )
  |> String.concat ""