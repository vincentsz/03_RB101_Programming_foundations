=begin

1.Understand the problem
Input: a positive integer and a boolean. Output: The bonus; an integer.
Rules: If boolean is true, bonus should be half the salary, if teh boolean is false the bonus should be 0.
2.Test cases 
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
3.Data structure
4.
5.
=end

def calculate_bonus (value, boolean)
  boolean ? value/2 : 0
end

puts calculate_bonus(2800, true) 
puts calculate_bonus(1000, false) 
puts calculate_bonus(50000, true) 