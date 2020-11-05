=begin
1.Understand problem

2.Examples
string_to_integer('4321') == 4321
string_to_integer('570') == 570
3.Data structure

4.Algorithm
Iterate over input, puting each character in an array. 
=end

def string_to_integer(number)
  reference_hash = {}
  "0123456789".chars.each_with_index do |n, i|
  reference_hash[n] = i
  end

  current = number.chars.map! do |n|
    reference_hash[n]
  end

  sum = 0
  current.reverse!.each_with_index do |n, i|
    sum += n * (10**i)
  end
  sum
end
  

string_to_integer('4321') == 4321
string_to_integer('570') == 570

#further exploration

=begin
1.Understand problem
Input:Hexadecimal numbr as a string
Output: Decimal equivalent of input
Rules: 0-9 = 0-9 A-F = 11 - 15
2.Examples
hexadecimal_to_integer('4D9f') == 19871
3.Data structure

4.Algorithm

=end

#further exploration

def hexadecimal_to_integer(number)
  hexadecimal_key = {}
  "0123456789ABCDEF".chars.each_with_index { |n, i| hexadecimal_key[n] = i}

  current = number.upcase.chars.map {|hex| hexadecimal_key[hex]}

  sum = 0
  current.each {|n| sum = (sum * 16) + n}

  sum
end

hexadecimal_to_integer('4D9f') == 19871