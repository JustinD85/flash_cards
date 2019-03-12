require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < MiniTest::Test

  def setup
    @card_1 = Card.new("What is the capital of Georgia?", "Atlanta", :Geography)
    @card_2 = Card.new("What is 1 + 1?", "2", :Math)
    @card_4 = Card.new("What is 1 + 2?", "3", :Math)
    @card_3 = Card.new("What is the best color?", "Purple", :Facts)
    @cards = [@card_1, @card_2, @card_3, @card_4]
    @deck = Deck.new(@cards)
  end

  def test_it_should_exist
    assert_instance_of Deck, @deck
  end

  def test_it_should_have_cards
    assert_equal @cards, @deck.cards
  end

  def test_it_should_have_no_cards_if_not_given_array
    card_as_num = 3
    deck1 = Deck.new(card_as_num)
    deck2 = Deck.new(@card_1)
    assert_equal [], deck1.cards
    assert_equal [], deck2.cards
  end

  def test_it_should_return_card_count
    assert_equal 4 , @deck.count
  end

  def test_it_should_return_cards_in_category
    assert_equal [@card_1], @deck.cards_in_category(:Geography)
    assert_equal [@card_2, @card_4], @deck.cards_in_category(:Math)
    assert_equal [@card_3], @deck.cards_in_category(:Facts)
  end

end

