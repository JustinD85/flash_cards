require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

class RoundTest < MiniTest::Test
  attr_reader :deck, :round
  def setup
    @card_1 = Card.new("What is 1 + 1?", "2", :Math)
    @card_2 = Card.new("What is 2 - 1?", "1", :Math)
    @card_3 = Card.new("Where is waldo?", "No one knows", :Facts)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_it_should_exist
    assert_instance_of Round, round
  end

  def test_it_should_have_a_deck
    assert_equal deck, round.deck
  end

  def test_it_should_have_empty_array
    assert_equal [], round.turns
  end

  def test_it_should_have_a_current_card
    assert_equal @card_1, round.current_card
  end

  def test_it_should_return_a_new_turn
    assert_instance_of Turn, round.take_turn("2")
    assert_equal "What is 1 + 1?", round.turns.first.card.question
  end

  def test_the_new_turns_answer_should_be_correct
    round.take_turn("2")
    assert_equal true, round.turns.first.correct?
  end

  def test_it_should_have_one_turn
    round.take_turn("2")
    assert_equal 1, round.turns.count
  end

  def test_it_should_have_one_correct
    round.take_turn("2")
    assert_equal 1, round.number_correct
  end

  def test_it_should_have_one_correct_after_two_turns
    round.take_turn("2")
    round.take_turn("2")
    assert_equal "Incorrect.", round.turns.last.feedback
    assert_equal 1, round.number_correct
  end

  def test_it_should_have_1_correct_in_category
    round.take_turn("2")
    assert_equal 1, round.number_correct_by_category(:Math)
    assert_equal 0, round.number_correct_by_category(:Facts)
  end

  def test_it_should_return_correct_percentage
    round.take_turn("2")
    round.take_turn("2")
    assert_equal 50.0, round.percent_correct
  end

end
