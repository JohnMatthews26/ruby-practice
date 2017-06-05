class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
    el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end

class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    if lookup(key) == nil
      @map << [key, value]
    else
      @map.map! {|arr| arr[0] == key ? arr[1] = value : arr}
    end
  end

  def lookup(key)
    @map.each {|arr| return arr[1] if arr[0] == key}
  end

  def remove(key)
    
  end
end
