require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/card'

class CardGeneratorTest < MiniTest::Test
  attr_reader :card_generator

  def setup
    @card_generator = CardGenerator.new("./lib/cards.txt")
  end
  
  def test_it_should_exist
    assert_instance_of CardGenerator, card_generator
  end

  def test_it_should_have_correct_file_path
    assert_equal "./lib/cards.txt", card_generator.filename
  end
  
  def test_it_should_create_array_of_cards
    assert_instance_of Array, card_generator.cards
  end

  def test_it_should_have_only_cards_in_array
    card_generator.cards.each{ |card| assert_instance_of Card, card }
  end

end
