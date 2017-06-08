
module HandHelper

  def royal_flush
    straight_flush && @contents.any? { |card| card.rank == 14 }
  end

  def straight_flush
    straight && flush
  end

  def flush
    cards = @contents
    flushsuit = cards[0].suit
    cards[1..-1].all? {|card| card.suit == flushsuit}
  end

  def straight
    cards = @contents
    nums = cards.map(&:rank)
    cards.uniq.length == 5 && (cards.max - cards.min) == 4
  end

  def x_oak(num, counts = 1)
    cards_hash = {}
    cards = @contents
    nums = cards.map(&:rank)
    cards.each do |card|
      cards_hash[card.rank] = nums.count(card.rank)
    end
    if counts == 2
      return cards_hash.values.count(num) == 2
    end
    cards_hash.value?(num)
  end

  def full_house
    x_oak(3) && x_oak(2)
  end

  def two_pair
    x_oak(2, 2)
  end

  def high_card
    true
  end

  def beats?(hand)
    types=[]
    types<<Proc.new{royal_flush}
    types<<Proc.new{straight_flush}
    types<<Proc.new{x_oak(4)}
    types<<Proc.new{full_house}
    types<<Proc.new{flush}
    types<<Proc.new{straight}
    types<<Proc.new{x_oak(3)}
    types<<Proc.new{two_pair}
    types<<Proc.new{x_oak(2)}
    types<<Proc.new{high_card}
    stuff_i_have = types.map{|prc| prc.call}
    stuff_enemy_has = types.map{|prc| hand.prc.call}
    stuff_i_have.each_with_index do |el, idx|
      if el && !stuff_enemy_has[idx]
        return true
      elsif !el && stuff_enemy_has[idx]
        return false
      end
    end
    return "tie"
  end

end
