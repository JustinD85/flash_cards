class Deck
  attr_reader :cards

  def initialize(c)
    @cards = (c.is_a? Array)? c : []
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    @cards.select { |card| card.category == category  }
  end
end
