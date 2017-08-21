class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next = self.next
    self.next.prev = self.prev
    # optional but useful, connects previous node to next node
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    current = @tail.prev
    until current == @head
      return current.val if current.key == key
      current = current.prev
    end
    nil
  end

  def include?(key)
    current = @tail.prev
    until current == @head
      return true if current.key == key
      current = current.prev
    end
    false
  end

  def append(key, val)
    new_link = Node.new(key, val)
    new_link.next = @tail
    new_link.prev = @tail.prev
    @tail.prev.next = new_link
    @tail.prev = new_link
  end

  def update(key, val)
    current = @tail.prev
    until current == @head
      current.val = val if current.key == key
      current = current.prev
    end
  end

  def remove(key)
    current = @tail.prev
    until current == @head
      if current.key == key
        current.next.prev = current.prev
        current.prev.next = current.next
      end
      current = current.prev
    end
  end

  def each
    current = @head.next
    until current == @tail
      yield(current)
      current = current.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
