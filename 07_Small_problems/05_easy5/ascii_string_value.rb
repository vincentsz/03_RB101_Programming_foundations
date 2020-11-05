=begin
1.Understand problem
Input: a string
Output: an integer which is the sum of the ASCII values of each character in the string
2.Examples
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

3.Data structure
array
4.Algorithm

=end

def ascii_value(string)
  string.chars.map {|c| c.ord }.sum
end

ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

#further exploration

# mystery is Integer#chr