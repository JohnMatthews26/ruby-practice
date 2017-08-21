class MaxIntSet
  def initialize(max)
    @max = max
    @store = []
    (max + 1).times do |i|
      @store.push(false)
    end
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    if num > @max || num < 0
      false
    else
      true
    end

  end

  def validate!(num)
    unless is_valid?(num)
      raise "Out of bounds"
    end
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num][num] = true
  end

  def remove(num)
    self[num][num] = false
  end

  def include?(num)
    self[num][num]
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % 20]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new() }
    @count = 0
  end

  def insert(num)
    if @count >= num_buckets
      resize!
    end

    self[num].push(num)
    @count += 1
  end

  def remove(num)
    self[num].delete(num)
    @count -= 1
  end

  def include?(num)
    self[num].include?(num)


  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!

    @count = 0
    old_store = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    old_store.each do |subarr|
      subarr.each do |num|
        self.insert(num)
      end
    end

  end
end
