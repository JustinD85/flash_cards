require './lib/card.rb'
require './lib/deck.rb'
require './lib/turn.rb'
require './lib/round.rb'

card_1 = Card.new("What is 1 + 1?", "2", :Math)
card_2 = Card.new("What is 20 - 18?", "2", :Math)
card_3 = Card.new("Where is Waldo?", "Behind the fire hydrant", :Facts)
card_4 = Card.new("Coolest Backend student?", "Nico", :Facts)

deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)
round.start

