require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < MiniTest::Test
  attr_reader :card_generator

  def setup
    @card_generator = CardGenerator.new('../lib/cards.txt')
  end
  
  def test_it_should_exist
    assert_instance_of CardGenerator, card_generator
  end

end
