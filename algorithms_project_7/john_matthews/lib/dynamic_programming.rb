class DynamicProgramming

  def initialize
    @blair_cache = {1 => 1, 2 => 2, 3 => 6}
    @sf_cache = {}
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]
    return 0 if n < 1
    @blair_cache[n] = blair_nums(n - 1) + blair_nums(n - 2) + ((n - 1) * 2) - 1
    return @blair_cache[n]
  end

  def frog_hops_bottom_up(n)
    frog_cache_builder(n)
  end

  def frog_cache_builder(n)
    j_hash = { 1 => [[1]], 2 => [[1, 1], [2]], 3 => [[1, 1, 1],[1, 2],[2, 1],[3]] }
    if n < 4
      return j_hash[n]
    end
    x = 4

    until x == n + 1


      total_arr = []
      j_hash[x - 1].each do |subarr|
        arr1 = []
        subarr.each do |num|
          arr1.push(num)
        end
        arr1.unshift(1)
        total_arr.push(arr1)
      end

      j_hash[x - 2].each do |subarr|
        arr2 = []
        subarr.each do |num|
          arr2.push(num)
        end
        arr2.unshift(2)
        total_arr.push(arr2)
      end

      j_hash[x - 3].each do |subarr|
        arr3 = []
        subarr.each do |num|
          arr3.push(num)
        end
        arr3.unshift(3)
        total_arr.push(arr3)
      end
      j_hash[x] = total_arr
      x += 1


    end


    return j_hash[n]

  end

  def frog_hops_top_down(n)

    return frog_hops_top_down_helper(n)


    # return frog_hops_top_down(n - 1).map { |e| e.push(1)  } + frog_hops_top_down(n - 2).map { |e| e.push(2)  } + frog_hops_top_down(n - 3).map { |e| e.push(3)  }
  end

  def frog_hops_top_down_helper(n)
    return [[1]] if n == 1
    return [[1, 1], [2]] if n == 2
    return [[1, 1, 1],[1, 2],[2, 1],[3]] if n == 3

    return frog_hops_top_down(n - 1).map { |e| e.push(1)  } + frog_hops_top_down(n - 2).map { |e| e.push(2)  } + frog_hops_top_down(n - 3).map { |e| e.push(3)  }
  end

  def super_frog_hops(n, k)
    if @sf_cache[k].nil?
      @sf_cache[k] = { 0 => [[]], 1 => [[1]]}
    end
    return @sf_cache[k][n] if @sf_cache[k][n]
    superfrog = []
    if n < k
      k = n
    end
    (1..k).each do |idx|
      superfrog += super_frog_hops(n - idx, k).map { |el| el + [idx] }
    end
    @sf_cache[k][n] = superfrog
    superfrog
  end

  def knapsack(weights, values, capacity)
    return 0 if capacity.zero? || weights.length.zero?
    table = knapsack_table(weights, values, capacity)
    table[capacity][weights.length - 1]
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    table = []

    (0..capacity).each do |cap|
      table[cap] = []

      (0...weights.length).each do |weight|
        if cap.zero?
          table[cap][weight] = 0
        elsif weight.zero?
          table[cap][weight] = values[0]
          table[cap][weight] = 0 if weights[0] > cap
        else
          option1 = table[cap][weight - 1]
          if weights[weight] > cap
            option2 = 0
          else
            option2 = table[cap - weights[weight]][weight - 1] + values[weight]
          end
          table[cap][weight] = [option1, option2].max
        end
      end
    end

    table

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
