
require 'player'
require 'rspec'

describe Player do
  let(:mock_hand) { "Hand" }
  context '#initialize' do
    it 'Initializes the starting chips' do
      expect(Player.new(500).chip_stack).to eq(500)
    end
  end
  context '#assign_hand' do
    it 'Associates a hand with the player' do
      p1 = Player.new(500)
      p1.assign_hand(mock_hand)
      expect(p1.hand).to eq("Hand")
    end
  end
end
