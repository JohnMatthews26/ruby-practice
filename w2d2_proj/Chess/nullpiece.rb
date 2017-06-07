require 'singleton'
class NullPiece < Piece
  include Singleton
  def initialize
  end

  def color
  end

  def symbol
    str = "   "
  end
end
