require './lib/card.rb'
require './lib/deck.rb'
require './lib/turn.rb'
require './lib/round.rb'
require './lib/card_generator.rb'

cards = CardGenerator.new('./lib/cards.txt').cards
deck = Deck.new(cards)
round = Round.new(deck)
round.start

