fun name (input: string option) =
  let val name = case input of
    NONE => "you"
  | SOME name => name
  in
    "One for " ^ name ^ ", one for me."
  end
