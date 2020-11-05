=begin

1.Understand problem
Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.
2.Examples
3.Data structure
Array 1 to 99
4.Algorithm
Create array, range 1 to 99. Print all numbers on even position.

=end

numbers = (1..99).to_a

numbers.each do |n|
  if n%2 == 1
    puts n
  end
end

1.upto(99) {|n| puts n if n.odd?}