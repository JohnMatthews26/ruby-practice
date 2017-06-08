require "byebug"
require 'rspec'
require 'w2d3_warmup'

describe '#uniq' do
  array_in = [1, 2, 1, 3, 3]
  array_out = [1, 2, 3]
  it "Returns array without duplicates" do
    expect(uniq(array_in)).to eq(array_out)
  end
end

describe '#two_sum' do
  it "returns an empty array if there are no pairs" do
    expect(two_sum([1,2,3,-4])).to eq([])
  end
  it "returns all sum indices if there are pairs" do
    expect(two_sum([-1,0,2,-2,1])).to eq([[0,4],[2,3]])
  end
  it "correctly handles multiple duplicates" do
    expect(two_sum([-3,3,3])).to eq([[0,1],[0,2]])
  end
end
describe Array do
  subject(:atest) { Array.new }
  #
  let(:dummy) {double("array", Array.new)}

  describe '#my_transpose' do
    it "Does not use built in Array#transpose method" do
      expect(dummy).not_to receive(:transpose)
      dummy.my_transpose
    end
    arr = [[0,1,2],[3,4,5],[6,7,8]]
    expected = [[0,3,6],[1,4,7],[2,5,8]]
    it "Switches rows and columns" do
      expect(arr.my_transpose).to eq(expected)
    end
  end
end

describe '#stock_picker' do
  it "Picks a profitable pair of days" do
    input = [3, 3, 3, 2, 3, 7, 5]
    expect(stock_picker(input)).to eq([3,5])
  end

  it "Only picks forward" do
    input = [3, 3, 2, 3, 7, 1, 2]
    expect(stock_picker(input)).to eq([2,4])
  end

end


describe Towers do
  describe '#Initialize' do
    it 'Sets up instance variables' do
      setup = Towers.new
      expect(setup.pile[0]).to eq([3,2,1])
      expect(setup.pile.size).to eq(3)
    end
  end

  describe '#won?' do
    un_won = Towers.new
    won = Towers.new
    won.pile[0] = []
    won.pile[1] = [3,2,1]
    it 'Returns false for an un-won board' do
      expect(un_won.won?).to be_falsey
    end
    it 'Returns true for a won board' do
      expect(won.won?).to be_truthy
    end
  end

  describe '#play'
end
