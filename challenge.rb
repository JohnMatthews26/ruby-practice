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

p holiday_trip([0])
