infix |>
fun (x |> f) = f x
infix />
fun (f /> g) = g o f

fun abbreviate (phrase: string): string =
  let fun splitter (c: char): bool = 
          (Char.isSpace c) orelse (Char.isPunct c andalso not (c = #"'"))
      val firstLetterOfWord = String.explode /> List.hd /> Char.toUpper
  in
    phrase |>
      String.tokens splitter |>
      List.map firstLetterOfWord |>
      String.implode
  end
