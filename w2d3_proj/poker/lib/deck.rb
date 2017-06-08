
require_relative 'hand'
class Deck

  attr_reader :cards, :suits

  def initialize
    @cards = [ ]
    @suits = [:spade, :club, :diamond, :heart]
    @suits.each do |suit|
      (2..14).to_a.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end
  end

  def shuffle
    @cards.shuffle!
    self
  end

  def draw_card
    @cards.pop
  end

end

deck=Deck.new
hand1=Hand.new
hand2=Hand.new
hand1.render
hand2.render

puts hand1.beats?(hand2)
