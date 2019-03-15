class Turn
  attr_reader :guess, :card

  def initialize(g,c)
    @guess = g
    @card = c
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    correct? ? "Correct!" : "Incorrect."
  end

end
