require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @count = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
    @start_idx = 0
    @length = @count
  end

  # O(1)
  def [](index)
    if index >= @count
      raise "index out of bounds"
    else
      return @store[(index + @start_idx + 1) % @length]
    end
  end

  # O(1)
  def []=(index, value)
    @count += 1
    @length += 1
    @store[(index + @start_idx + 1) % @length] = value
  end

  # O(1)
  def pop
    if @count == 0
      raise "index out of bounds"
    else
      @count -= 1
      @length -= 1
      x = store[@count + @start_idx]
      store[@count + @start_idx] = nil
      return x
    end
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    if @count == @capacity
      @capacity *= 2
    end
    @store[@count + @start_idx] = val
    @count += 1
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    if @count == 0
      raise "index out of bounds"
    else
      @count -= 1
      @length -= 1
      x = store[@start_idx]
      store[@start_idx] = nil
      @start_idx += 1
      return x
    end

  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    if @count == @capacity
      @capacity *= 2
    end
    @store[@count] = val
    @start_idx = @count
    @count += 1
    @length += 1
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
  end
end
