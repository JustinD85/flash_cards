require './lib/turn'

class Round
  attr_reader :deck, :turns

  def initialize(d)
    @deck = d
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    turns << new_turn
    deck.cards.shift
    new_turn
  end

  def number_correct
    @turns.reduce(0) do |acc, turn|
      (turn.correct?) ?
        acc += 1 : acc
    end
  end

  def number_correct_by_category(category)
    correct_answers = @turns.select do |turn|
      turn.card.category == category
    end
    correct_answers.count
  end

  def percent_correct
    total_turns = @turns.count.to_f
    correct_turns = @turns.select { |turn| turn.correct? }.count
    (correct_turns / total_turns) * 100
  end
end
