
class Piece

  attr_accessor :position
  def initialize
    @position = []
  end

  def move_piece(startpos, endpos)
    @position = [startpos, endpos]
  end

  def symbol
    "X"
  end

end
