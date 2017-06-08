require_relative 'player'
require_relative 'deck'
require_relative 'hand'

class Game
  attr_reader :deck, :players, :pot

  def initialize(player_count, starting_chips = 200)
    player_count.times do |i|
      @players.push(Player.new(starting_chips))
    end
  end

  def new_round
    @deck = Deck.new
    @deck.shuffle
    @players.shuffle!
    @players.each do |player|
      if player.retrieve_ante
        @pot += 1
        player.folded = false
        deal_hand(player)
      else
        @players.delete(player)
      end
    end
    self
  end

  def turn
    bet = 0
    @players.each do |player|
      next if player.folded == true
      response = player.action(bet)
      if response == "f"
        player.folded = true
      elsif response == "r"
        bet = player.raise_amount(bet)
      elsif response == "c"
        player.call(bet)
      end
    end
  end

  def deal_hand(player)
    5.times do |i|
      player.hand.add_card(deck.draw_card)
    end
  end
end
