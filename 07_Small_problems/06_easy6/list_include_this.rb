def include?(array, value)
  if array.select { |num| num == value} != []
    true
  else
    false
  end
end

include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false

#textbook solution

def include?(array, value)
  !!array.find_index(value)
end