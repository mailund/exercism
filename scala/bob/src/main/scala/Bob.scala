object Bob {
  def allCaps(s: String): Boolean = 
    val letters = s.filter(_.isLetter)
    letters.forall(_.isUpper) && letters.nonEmpty
  
  def response(statement: String): String = 
    val s = statement.trim
    (allCaps(s), s.endsWith("?")) match {
      case (true, true) => "Calm down, I know what I'm doing!"
      case (true, false) => "Whoa, chill out!"
      case (false, true) => "Sure."
      case (false, false) => if (s.isEmpty) "Fine. Be that way!" else "Whatever."
    }
}
