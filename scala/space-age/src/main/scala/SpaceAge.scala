object SpaceAge {
  val earthYearInSeconds = 31557600
  def onEarth(age: Double): Double = age / earthYearInSeconds

  val earthYearsInVenusYears = 0.61519726
  def onVenus(age: Double): Double = onEarth(age) / earthYearsInVenusYears

  val earthYearsInMercuryYears = 0.2408467
  def onMercury(age: Double): Double = onEarth(age) / earthYearsInMercuryYears

  val earthYearsInMarsYears = 1.8808158
  def onMars(age: Double): Double = onEarth(age) / earthYearsInMarsYears

  val earthYearsInJupiterYears = 11.862615
  def onJupiter(age: Double): Double = onEarth(age) / earthYearsInJupiterYears

  val earthYearsInSaturnYears = 29.447498
  def onSaturn(age: Double): Double = onEarth(age) / earthYearsInSaturnYears

  val earthYearsInUranusYears = 84.016846
  def onUranus(age: Double): Double = onEarth(age) / earthYearsInUranusYears

  val earthYearsInNeptuneYears = 164.79132
  def onNeptune(age: Double): Double = onEarth(age) / earthYearsInNeptuneYears
}
