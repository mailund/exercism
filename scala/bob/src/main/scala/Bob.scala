object Bob {
  def allCaps(s: String): Boolean = 
    val letters = s.filter(_.isLetter)
    letters.forall(_.isUpper) && letters.nonEmpty
  
  def response(statement: String): String = 
    val s = statement.trim
    if (allCaps(s) && s.endsWith("?")) "Calm down, I know what I'm doing!"
    else if (allCaps(s)) "Whoa, chill out!"
    else if (s.endsWith("?")) "Sure."
    else if (s.isEmpty) "Fine. Be that way!"
    else "Whatever."
}
