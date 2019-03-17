require './lib/card'

class CardGenerator
  attr_reader :filename

  def initialize(filename)
  @filename = filename
  end

  def cards
    file = File.open(filename)
    prompts = file.read.split("\n")
    prompts.map do |prompt|
      card_info = prompt.split(",")
      question = card_info.shift
      answer = card_info.shift
      category = card_info.shift.to_sym
      Card.new(question,answer,category)
    end
  end
end
