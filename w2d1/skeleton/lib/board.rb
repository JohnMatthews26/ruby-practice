require 'byebug'
class Board
  attr_accessor :cups
  attr_reader :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14)
    place_stones
  end

  def place_stones
    @cups.each_with_index do |_, idx|
      if idx == 6 || idx == 13
        @cups[idx] = []
      else
        @cups[idx] = :stone, :stone, :stone, :stone
      end
    end
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 12 || @cups[start_pos].empty?
      raise "Invalid starting cup"
    end

  end

  def make_move(start_pos, current_player_name)
    idx = 0
    position = idx + start_pos
    until @cups[start_pos].empty?
      position += 1
      position = 0 if position > 13
      if current_player_name == @name1 && position == 13
        position = 0
      elsif current_player_name == @name2 && position == 6
        position += 1
      else
        @cups[position] << @cups[start_pos].pop
      end
    end
    render
    next_turn(position, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    if ending_cup_idx == 6 && current_player_name == @name1
      return :promt
    elsif ending_cup_idx == 13 && current_player_name == @name2
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end

class InvalidStartingCupError < StandardError
  attr_reader :message
  def message
    puts "Invalid starting cup"
  end
end
