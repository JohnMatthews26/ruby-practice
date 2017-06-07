require 'colorize'
require_relative 'board'
require_relative 'cursor'


class Display
  attr_reader :cursor
  def initialize(board)
    @dis_board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @dis_board.grid.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        str =  " #{piece.symbol} "
        print @cursor.cursor_pos == [i, j] ? str.colorize(:background => :red) : str
      end
      print "\n"
    end
  end


end
