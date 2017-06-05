require 'byebug'
def sum_to(n)
  return nil if n < 0
  if n == 1
    return 1
  else
    n + sum_to(n - 1)
  end
end

def my_flatten(arr)
  new_arr = []
  if arr.class != Array
    return (new_arr += [arr])
  else
    arr.each do |x|
      new_arr += my_flatten(x)
    end
  end
  new_arr
end

def add_numbers(nums_arr)
  if nums_arr.length == 1
    return nums_arr[0]
  else
    nums_arr[0] + add_numbers(nums_arr[1..-1])
  end
end

def gamma_function(n)
  if n == 1
    return 1
  else
    (n - 1) * gamma_function(n - 1)
  end
end

def ice_cream_shop(flavors, favorite)
  if flavors[0] == favorite
    return true
  elsif flavors.length <= 1
    return false
  else
    ice_cream_shop(flavors[1..-1], favorite)
  end
end

def reverse(str)
  if str.length <= 1
    return str
  else
    str[-1] += reverse(str[0..-2])
  end
end

def subset(arr)
  new_arr = []
  if arr.empty?
    return [[]]
  else

    new_arr += subset(arr[0...-1])
    new_arr += arr.combination(arr.length - 1).to_a
    new_arr += [arr]

  end
  new_arr.uniq
end
