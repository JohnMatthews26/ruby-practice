fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
#O(n)
def clever_octopus(arr)
  biggest_fish = nil
  arr.each do |x|
    biggest_fish = x if biggest_fish.nil? || biggest_fish.length < x.length
  end
  biggest_fish
end

def sluggish_octopus(arr)
  biggest_fish = nil
  arr.each_with_index do |x, idx|
    biggest_fish = x
    return biggest_fish if idx == arr.length - 1
    arr[idx+1..-1].each do |y|
      biggest_fish = nil if y.length > x.length
    end
  end
end
