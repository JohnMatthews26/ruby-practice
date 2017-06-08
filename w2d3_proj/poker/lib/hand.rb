require_relative 'card'
require_relative 'handhelper'
require 'colorize'

class Hand
  include HandHelper
  attr_reader :contents

  def initialize
    @contents = []
  end

  def add_card(card)
    @contents << card
  end

  def remove_card(card)
    contents.delete(card)
  end

  def render
    string = ""
    contents.each do |card|
      string += card.symbol
      string += " - "
    end
    puts string
  end

end
