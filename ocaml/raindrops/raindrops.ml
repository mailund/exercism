let raindrop n =
  let sounds = [ (3, "Pling"); (5, "Plang"); (7, "Plong") ] in
  let get_sound (factor, sound) = if n mod factor = 0 then sound else "" in
  match List.map get_sound sounds |> String.concat "" with
  | "" -> string_of_int n
  | sound -> sound
