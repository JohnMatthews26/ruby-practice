require 'rspec'
require 'game'

describe Game do
  subject(:game) { Game.new }
  context '#new_round' do
    it 'creates a new deck instance' do
      expect(game.new_round.deck).to be_a(Deck)
    end
  end
end
