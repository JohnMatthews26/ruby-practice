require_relative 'piece'

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    make_grid
  end

  def make_grid
    @grid.each_with_index do |row, rowidx|
      row.each_with_index do |col, colidx|
        if rowidx < 2 || rowidx > 5
          @grid[rowidx][colidx] = Piece.new
        else
          @grid[rowidx][colidx] = NullPiece.instance
        end
      end
    end
  end

  def move_piece(startpos, endpos)

    if @grid[startpos.first][startpos.last].is_a? NullPiece
      raise EmptyPlaceError
    else
      piece = @grid[startpos.first][startpos.last]
      piece.move_piece(endpos.first, endpos.last)
      @grid[startpos.first][startpos.last] = NullPiece.instance
      @grid[endpos.first][endpos.last] = piece
    end
  rescue EmptyPlaceError => e
    e.message
  end
end


class EmptyPlaceError < StandardError
  def message
    puts 'Invalid move: no piece in starting position'
  end
end
