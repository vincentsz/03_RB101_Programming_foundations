=begin

1.Understand problem
Input:  an array of elements(strings)
Output: Each element and it's occurence in the given array
Rules: The words in the array are case sensitive

2.Test cases
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
car => 4
truck => 3
SUV => 1
motorcycle => 2

3.Data structure
Element and its occurence should be stored in a hash

4.Algorithm
Iterate over each element in the array, store each element as a key with value 1 if it does not yet exist in the hash. If it already exists, increment it's the value with 1.
Iterate over the hash to print each element with its respective value.

=end


def how_many(array)
  occurences = {}
  loop do
    key = array.shift
    if occurences.has_key?(key)
      occurences[key] += 1
    else
      occurences[key] = 1
    end
    break if array == []
  end
  occurences.each{|x, y| puts "There #{y == 1 ? 'is' : 'are'} #{y} #{x}#{y == 1 ? '!' : 's!'}"}
end


vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
how_many(vehicles)

def how_many(array)
  counts = {}
  array.each do |vehicule|
    if counts.has_key?(vehicule)
      counts[vehicule] += 1
    else
      counts[vehicule] = 1
    end
  end
  p counts
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
how_many(vehicles)