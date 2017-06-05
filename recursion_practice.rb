def recur_range(starting, ending)
  new_arr = []
  return [] if ending < starting
  return starting if starting == ending - 1
  num_range = (starting..ending).to_a
  new_arr += [num_range[0]]
  new_arr += [recur_range(num_range[1], num_range[-1])]
  new_arr.flatten

end

def iter_range(starting, ending)
  new_arr = []
  return [] if ending < starting
  num_range = (starting...ending).to_a
  num_range.reduce(new_arr) {|acc, el| acc << el}
end

def deep_dup(arr)
  new_arr = []
  arr.dup if arr.class == Array
  return arr unless arr.class == Array
  arr.each do |x|
    new_arr << deep_dup(x)
  end
  new_arr
end

def subsets(arr)
return [[]] if arr.empty?

subs = subsets(arr[0..-2])
subs.concat(subs.map{|el| el += [arr.last]})

end

def permutations(arr)
  new_arr = []
  return arr if arr.length == 1
  permutations(arr[1..-1]).each do |x|
    new_arr << [x].flatten + [arr[0]]
    new_arr << [arr[0]] + [x].flatten
  end
  permutations(arr[0...-1]).each do |y|
    new_arr << [y].flatten + [arr[-1]]
    new_arr << [arr[-1]] + [y].flatten
  end
  new_arr.uniq.sort
end

def bsearch(arr, targ, idx = 0)
  div = arr.length / 2
  return div + idx if arr[div] == targ
  return nil if arr.length == 1
  fhalf = arr.take(div)
  fl = fhalf.length
  shalf = arr.drop(div)
  arr[div] > targ ? bsearch(fhalf, targ, idx) : bsearch(shalf, targ, idx + fl)
end

def merge_sort(arr)
  return arr if arr.length <= 1
  div = arr.length / 2
  left = arr.take(div)
  right = arr.drop(div)
  sorted_left, sorted_right = merge_sort(left), merge_sort(right)
  merge_help(sorted_left, sorted_right)
end

def merge_help(left, right)
  merge_array = []
  until left.empty? || right.empty?
    merge_array << ((left.first < right.first) ? left.shift : right.shift)
  end
  merge_array + left + right
end
