def solution(s)
  p s
  return -1 if s.length == 0
  inp_arr = s.split
  stack = []
  result = 0
  inp_arr.each do |inp|
    if inp == "DUP"
      if stack.length == 0
        result = -1
        break
      end
      stack.push(stack[-1])
    elsif inp == "POP"
      if stack.length == 0
        result = -1
        break
      end
      stack = stack[0...-1]
    elsif inp == "+"
      if stack.length < 2 || stack[-1] - stack[-2] > 2**20
        result = -1
        break
      end
      stack = stack[0...-2].push(stack[-1] + stack[-2])
    elsif inp == "-"
      if stack.length < 2 || stack[-1] - stack[-2] < 0 || stack[-1] - stack[-2] > 2**20

        result = -1
        break
      end
      stack = stack[0...-2].push(stack[-1] - stack[-2])
    else
      unless inp.to_i < 0 && inp.to_i >= 2**20
        stack.push(inp.to_i)
      else

        result = -1
        break
      end
    end
  end

  return -1 if result == -1 || stack.empty?

  return stack[-1]
end

def holiday_trip(a)
  return 1 if a.length == 1
  num_locs = a.uniq.length
  trips_hash = {}
  min = nil
  a.each_with_index do |loc, day|
    trips_hash[day] = [loc]
    x = day - 1
    while x >= 0
      trips_hash[x].push(loc)
      if trips_hash[x].uniq.length == num_locs && (min == nil || trips_hash[x].length < min)
        min = trips_hash[x].length
      end
      x -= 1
    end
  end
  return min
end

def holiday_trip2(a)
  
  return 1 if a.length == 1
  count = {}
  best_range = [0]

  a.each_with_index do |loc, orig_idx|
    #check whether the location is a new location
    if count[loc]
      count[loc] += 1
      # if existing location and the beginning of the best_range is the same location
      if a[best_range[0]] == loc
        count_dup = count.dup
        new_range = a[best_range[0]..orig_idx]
        # determine whether it is possible to construct a shorter time_span with latest location
        new_range.each_with_index do |el, sec_idx|
          if count_dup[el] == 1 && best_range[1] - best_range[0] >= orig_idx - sec_idx
            best_range = [sec_idx, orig_idx]
            count_dup[el] -= 1
            if count_dup[el] == 0
              break
            end
          elsif count_dup[el] == 1
            break
          else
            count_dup[el] -= 1
          end
        end
      end
    else
      #for new location, adjust best_range to include new location
      count[loc] = 1
      best_range = [best_range[0], orig_idx]
    end
  end
  return best_range[1] - best_range[0] + 1

end

p holiday_trip2([2, 1, 1, 3, 2, 1, 1, 3])
p holiday_trip2([7, 5, 2, 7, 2, 7, 4, 7])
