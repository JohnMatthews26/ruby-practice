require_relative 'piece'

class Rook < Piece
  include SlidingPiece

  def initialize
  end

  def move_dir
    [:right, :left, :up, :down]
  end

end
