error id: `<none>`.
file://<WORKSPACE>/src/main/scala/Bob.scala
empty definition using pc, found symbol in pc: `<none>`.
empty definition using semanticdb
|empty definition using fallback
non-local guesses:
	 -

Document text:

```scala
object Bob {
  def response(statement: String): String = 
    if (statement.isUpper) "Whoa, chill out!"
    else if (statement.endsWith("?")) "Sure."
    else if (statement.trim.isEmpty) "Fine. Be that way!"
    else "Whatever."
}

```

#### Short summary: 

empty definition using pc, found symbol in pc: `<none>`.