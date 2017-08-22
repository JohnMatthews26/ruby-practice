# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to



def install_order(arr)
  new_range = (arr.min.min..arr.max.max).to_a
  result_arr = []
  tup_hash = {}
  arr.each do |subarr|
    if tup_hash[subarr[0]]
      tup_hash[subarr[0]] = tup_hash[subarr[0]].push(subarr[1])
    else
      tup_hash[subarr[0]] = [subarr[1]]
    end
    new_range.delete(subarr[0])
  end
  until tup_hash.keys.empty?
    tup_hash.keys.each do |tup|
      if tup_hash[tup].any? { |el| tup_hash.keys.include?(el) }

      else
        result_arr.push(tup)
        tup_hash.delete(tup)
      end
    end
  end


  new_range.concat(result_arr)
  p new_range
  return new_range
end
