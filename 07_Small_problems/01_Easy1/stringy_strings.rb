=begin

1. Understand problem
Input is one positive integer. Output is a string of alternating 1 and 0, starting with 1, with a length of the given integer.
2.Test cases
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
3.Data structure
Input is integer, output is string, an array will be used to store the 0s and 1,s 
4.Algorithm
We create an array with each number of a sequence going from 0 up to the given integer. Incrementing over this array we creta another array where on each even position, including 0, a 1 needs to saved. In any uneven position a 0 need to be saved. The array will be flattened into s string.

=end

def stringy(integer)
    sequence = []
    array = []

  integer.times do |x|
    sequence << x
  end

  sequence.each do |n|
    if n.even? 
      array << 1
    else
      array << 0
    end
  end
array.join
end
puts stringy(0) == ''
puts stringy(1) == '1'
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

def stringy_2(integer, default = 1)
  numbers = []
  integer.times do |x|
    if default == 0
      number = x.odd? ? 1 : 0
    else
      number = x.even? ? 1 : 0
    end
    numbers << number
  end
  numbers.join
end

puts stringy_2(6,0) == '101010'
puts stringy_2(6,0) == '010101'
puts stringy_2(9) == '101010101'
puts stringy_2(4) == '1010'
puts stringy_2(7) == '1010101'

def stringy(int)
  int % 2 == 1 ? "10" * (int/2) + "1" : "10" * (int/2)
end
puts stringy(0) == ''
puts stringy(1) == '1'
puts stringy(2) == '10'
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'