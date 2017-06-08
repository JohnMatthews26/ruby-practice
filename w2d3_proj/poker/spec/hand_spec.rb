require 'rspec'
require 'hand'

describe Hand do
  subject(:hand) { Hand.new }
  let(:dummy_card) { "Card" }
  context '#initialize' do
    it 'Initializes a contents array' do
      expect(hand.contents).to be_a(Array)
    end
  end

  context 'add_card' do
    it 'Adds a card to the hand' do
      5.times { hand.add_card(dummy_card) }
      expect(hand.contents).to include(dummy_card)
    end
  end

  context 'remove_card' do
    it 'Removes a card that has been added' do
      1.times { hand.add_card(dummy_card) }
      hand.remove_card(dummy_card)
      expect(hand.contents.length).to eq(0)
    end
  end

  

end
