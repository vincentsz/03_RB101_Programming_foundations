=begin

1.Understand problem
input: a positive integer, output: sum of it's digits
2.Test cases
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
3.Data structure
Each digit of the positive integer will be stored in an array.
4.Algorithm
Each digit of the positive integer will be stored in an array. These elements will be added to each othet through iteration over array 

=end

def sum(number)
  number.digits.reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45