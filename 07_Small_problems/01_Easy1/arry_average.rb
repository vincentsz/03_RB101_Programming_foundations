=begin

1.Understand the problem
Input: an array containing integers, output: the average of all numbers in the array. Rules: array will nebver be empty and the numbers will always be positive integers. Output should be integer
2.Test cases
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
3.Data structure
Input is an array, output integer
4.Algorithm
All elements of the array will be added together through iteration over array. This total will be divided by the amount of elements in the array.

=end

def average(array)
  total = 0
  array.each do |n|
    total += n
  end
  total/array.size.to_f
end

puts average([1, 6]) 
puts average([1, 5, 87, 45, 8, 8]) 
puts average([9, 47, 23, 95, 16, 52]) 

