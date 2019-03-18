require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < MiniTest::Test
  attr_reader :turn, :card

  def setup
    @card = Card.new("What is the capitol of Massachusetts?", "Boston",:Geography)
    @turn = Turn.new("Boston", @card)
  end

  def test_it_exists
    assert_instance_of Turn, turn
  end

  def test_it_returns_the_guess
    assert_equal "Boston", turn.guess
  end

  def test_it_should_return_card
    assert_equal card, turn.card
  end

  def test_it_returns_true
    assert_equal true, turn.correct?
  end

  def test_it_returns_false_with_wrong_guess
    turn = Turn.new("Miami", card)
    assert_equal false, turn.correct?
  end

  def test_it_returns_false_when_given_wrong_args
    turn = Turn.new(1, card)
    assert_equal false, turn.correct?
  end

  def test_it_should_return_correct
    assert_equal "Correct!", turn.feedback
  end

  def test_it_should_return_incorrect_with_wrong_guess
    turn = Turn.new("Miami", card)
    assert_equal "Incorrect.", turn.feedback
  end

end
