require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "John") }
  let(:banana) { Dessert.new("banana",7,chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(banana.type).to eq("banana")
    end

    it "sets a quantity" do
      expect(banana.quantity).to eq(7)
    end

    it "starts ingredients as an empty array" do
      expect(banana.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("snowcone", "squirrel",chef )}.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      banana.add_ingredient("mushrooms")
      expect(banana.ingredients).to include("mushrooms")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
    banana.ingredients.shuffle
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do

    end
    it "raises an error if the amount is greater than the quantity" do

    end
  end


  describe "#serve" do
    it "contains the titleized version of the chef's name" do

    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do

  end
end
end
