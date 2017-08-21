class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @prc = prc
  end

  def count
    @store.length
  end

  def extract
    method = BinaryMinHeap.heapify_down(@store, 0, @store.length)
    val = method[0]
    @store = method[1..-1]
    return val
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, @store.length - 1)
  end

  public
  def self.child_indices(len, parent_index)
    first_idx = parent_index * 2 + 1
    second_idx = parent_index * 2 + 2
    if len <= first_idx

    elsif len <= second_idx
      return [first_idx]
    else
      return [first_idx, second_idx]
    end
  end

  def self.parent_index(child_index)
    if child_index == 0
      raise "root has no parent"
    end
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)

    prc ||= Proc.new {|x, y| x <=> y}
    children = BinaryMinHeap.child_indices(len, parent_idx)
    if children.nil?
      return array
    end
    child_1 = array[children[0]]

    parent = array[parent_idx]

    if children.length == 1
      if prc.call(parent, child_1) > 0
        array[parent_idx] = child_1
        array[children[0]] = parent
        return array
      else
        return array
      end
    else
      child_2 = array[children[1]]
      small_child = prc.call(child_1, child_2) < 0 ? [child_1, 0] : [child_2, 1]
      if prc.call(parent, small_child[0]) > 0
        array[parent_idx] = small_child[0]
        array[children[small_child[1]]] = parent
        BinaryMinHeap.heapify_down(array, children[small_child[1]], len, &prc)
      else
        return array
      end
    end


  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new {|x, y| x <=> y}
    if child_idx == 0
      return array
    end
    child = array[child_idx]
    parent = array[BinaryMinHeap.parent_index(child_idx)]



    if prc.call(child, parent) < 0
      array[self.parent_index(child_idx)] = child
      array[child_idx] = parent
      self.heapify_up(array, self.parent_index(child_idx), len, &prc)
    else
      return array
    end
  end
end
