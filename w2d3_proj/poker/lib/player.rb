
class Player
  attr_accessor :folded
  attr_reader :chip_stack, :hand

  def initialize(starting_chips)
    @chip_stack = starting_chips
  end

  def retrieve_ante
    return false if @chip_stack == 0
    @chip_stack -= 1
    true
  end

  def assign_hand(hand)
    @hand = hand
  end

  def assign_game(game)
    @game = game
  end

  def valid_number?(number)
    number.between?(0, 4)
  end

  def raise_amount(initial_bet)
    puts "How much would you like to raise by?"
    bet = gets.chomp.to_i
    @chip_stack -= (bet + initial_bet)
    return (bet + initial_bet)
  end

  def fetch_discards
    puts "Pick 1-3 cards to discard. Format is 2,3. Or, press return to discard no cards"
    choices = gets.chomp.split(',')
    choices.map!(&:to_i)
    unless choices.all? { |choice| valid_number?(choice) }
      p "Invalid format."
      return fetch_discards
    end
    if choices.length > 3
      p "Too many choices. You can only choose 0-3"
      return fetch_discards
    end
    # choices.each do |choice|
    #   @hand.drop_card(choice)
    #   @hand.add_card(@game.deck.draw_card)
    # end
  end

  def call(bet)
    @chip_stack -= bet
  end

  def action(call_amt)
    begin
    puts "Current bet is #{call_amt}"
    puts "Do you wish to (ch)eck, (c)all, (r)aise, or (f)old"
    input = gets.chomp
    input = input[0]
    raise "not valid input" unless valid_input?(input)
    rescue
    retry
    end
  end

  private
  def valid_input?(input)
    ["c", "r", "f"].include?(input)
  end

end
