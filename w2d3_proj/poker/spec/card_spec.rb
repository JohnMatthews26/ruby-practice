require 'card'
require 'rspec'

describe Card do
  subject(:card) { Card.new(:spade, 9) }
  describe '#initialize' do
    it "Properly intializes attributes" do
      expect(card.suit).to eq(:spade)
      expect(card.rank).to eq(9)
    end
  end

  describe '#symbol' do
    it "Returns the correct symbol" do
      expect(card.symbol).to eq("9♠")
    end
  end
end
