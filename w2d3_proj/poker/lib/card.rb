

class Card
  attr_reader :rank, :suit

  def initialize(suit, rank)
    @rank = rank
    @suit = suit
  end

  def symbol
    return "#{rank}♣" if suit == :club
    return "#{rank}♦" if suit == :diamond
    return "#{rank}♥" if suit == :heart
    return "#{rank}♠" if suit == :spade
  end

end
