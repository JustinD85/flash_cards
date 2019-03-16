require './lib/turn'

class Round
  attr_reader :deck, :turns

  def initialize(d)
    @deck = d
    @turns = []
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    turns << new_turn
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

  def start
    
    system("clear")
    puts "Welcome! You're playing with #{@deck.cards.count} cards"
    puts "-" * 40
    while @deck.count != @turns.count
      system("clear")
      puts "This is card number #{@turns.count + 1} of #{}"
      puts "Question: #{current_card.question}"
      take_turn(gets.chomp)
      puts "You are #{@turns.last.feedback}"
      sleep 1
    end

    puts "#{"*" * 5} Gameover #{"*" * 5}"
    puts "You have #{number_correct} correct guesses out of #{@deck.cards.count} for a total score of %#{percent_correct}."
    category = @turns.map { |turn| turn.card.category }.uniq
    category.each do |cat|
      p "#{cat} - #{percent_correct_by_category(cat)}%"
    end
  end

  def percent_correct_by_category(category)
    total_in_cat = @deck.cards_in_category(category).count.to_f
    correct_in_cat = @turns.select do |turn|
      turn.card.category == category && turn.correct?
    end.count
    correct_in_cat / total_in_cat * 100
  end
end
