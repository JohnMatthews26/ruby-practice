 require 'deck'
 require 'rspec'

describe Deck do
  subject(:test_deck) { Deck.new }
  # let(:dummy) { Card.new }
  # let(:spade) { double("spade", :suit => :spade)}
  describe '#initialize' do
    it 'Initializes a 52 card deck' do
      expect(test_deck.cards.length).to eq(52)
    end
    it 'Initializes all cards as card objects' do
      expect(test_deck.cards.all? { |card| card.is_a?(Card) }).to eq(true)
    end
    it 'Assigns suits and numbers to cards' do
      expect(test_deck.cards.any? { |card| card.suit == :spade }).to eq(true)
    end
  end
  describe '#shuffle' do
    let(:dummy_deck) { Deck.new }
    it 'Randomizes cards in the deck' do
      expect(dummy_deck.shuffle.cards).not_to eq(test_deck.cards)
    end
  end
  describe '#draw_card' do
    it 'returns a card' do
      expect(test_deck.draw_card).to be_a(Card)
    end
    it 'Shrinks the deck cards' do
      5.times { test_deck.draw_card }
      expect(test_deck.cards.length).to eq(47)
    end
  end
end
