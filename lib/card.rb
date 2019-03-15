class Card
  attr_accessor :question, :answer, :category

  def initialize(q,a,c) #spell out all intialize variables
    @question = q
    @answer = a
    @category = c
  end
end
