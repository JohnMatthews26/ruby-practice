require 'byebug'

def uniq(ary)
  # debugger
  return ary if ary.length <= 1
  prev = uniq(ary[1..-1])
  prev << ary[0] unless prev.include?(ary[0])
  return prev.sort
end

def two_sum(arr)
  output = []
  arr.each_with_index do |ele, idx|
    arr[idx + 1..-1].each_with_index do |eletwo, idxtwo|
      output << [idx, idx + 1 + idxtwo] if ele + eletwo == 0
    end
  end
  output
end

class Array
  def my_transpose
    arr = self.dup
    out = []
    arr.each_with_index do |col, colidx|
      col.each_with_index do |num, rowidx|
        if out[rowidx].is_a?(Array)
          out[rowidx] << num
        else
          out[rowidx] = [num]
        end
      end
    end
    out
  end
end

def stock_picker(arr)
  output = [0,0]
  ratio = nil
  arr.each_with_index do |ele, idx|
    arr[idx + 1..-1].each_with_index do |eletwo, idxtwo|
      test_ratio = eletwo.to_f / ele
      if ratio.nil? || test_ratio > ratio
        ratio = test_ratio
        output = [idx,idxtwo + idx + 1]
      end
    end
  end
  output
end

class Towers

  attr_accessor :pile

  def initialize
    @pile = Array.new(3)
    @pile[0] = [3,2,1]
    @pile[1] = []
    @pile[2] = []
  end


  def play(start_tower, end_tower)

  end

  def won?
    pile[0].empty? && (pile[1].length == 3 || pile[2].length == 3)
  end

end
