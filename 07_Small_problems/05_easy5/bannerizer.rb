=begin
1.Understand problem
Input: Any kind of string
Output:Another string: the input string surrounded by a 'box'
Rules:The box is defined as such:
First line: 
-A string with length of input + 4, first and last symbol is +, the rest is -
Second line:
-A string with length of input +4, first and last symbol is |, the rest is ''
-Third line:
- The input string with spaces added before and after, first and last symbol is |
Fourth line:
- equals second line
Fifth line
-equals first line

Input will always fit in your terminal window.
2.Examples
print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+

3.Data structure

4.Algorithm
Store string length in variable string_length. 
Declare variable first_and_last_line = '+' + '-' * (string_length + 2) + '+'
Declare variable second_and_forthline = '|' + ' ' * (string_length + 2) + '|'
Declare third_line = '| ''+ input + ' |'
puts first_and_last_line, second_and_forthline, third_line, second_and_forthline, first_and_last_line
=end

def print_in_box(input)
  length = input.size
  first_and_last_line = '+' + '-' * (length + 2) + '+'
  second_and_fourth_line = '|' + (' ' * (length + 2)) + '|'
  third_line = '| ' + input + ' |'
  puts first_and_last_line, second_and_fourth_line, third_line, second_and_fourth_line, first_and_last_line
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')

#further exploration
=begin
4.Algorithm
Define MAX_LENGTH = 76
Calculate quotient and remainder of string_length divide by MAX_length
Create a loop with counter starting at 1. Slice first 76 characters and store in array lines. Repeat until counter reaches number of lines.
Declare variable first_and_last_line = '+' + '-' * (lines[0] + 2) + '+'
Declare variable second_and_second_last_line = '|' + ' ' * (lines[0] + 2) + '|'
Iterate through array. If element length == 76, add '| ' before and ' |' after
Ii element length < 76, add '| ' before, add (MAX-element.length) /2 before and after, and ' |' after
puts first_and_last_line, second_and_forthline, array, second_and_forthline, first_and_last_line
=end

MAXIMUM_LENGTH = 76

def print_in_box(input)
  sliced_words = []
  number_of_lines = (input.size / (MAXIMUM_LENGTH + 1))+1
  counter = 0
  while counter < number_of_lines do 
    sliced_words << input.slice!(0..MAXIMUM_LENGTH-1)
    counter += 1
  end

  first_and_last_line = '+' + ('-' * sliced_words[0].size) + '+'
  second_and_second_last_line = '|' + (' ' * sliced_words[0].size)+ '|'

  sliced_words.map! do |words|
    if sliced_words[0].size != (MAXIMUM_LENGTH + 4)
      '| ' + words + ' |'
    else
       '| ' + words.center(MAXIMUM_LENGTH) + ' |'
    end
  end

first_and_last_line = '+' + ('-' * (sliced_words[0].size - 2)) + '+'
second_and_second_last_line = '|' + (' ' * (sliced_words[0].size - 2))+ '|'

puts first_and_last_line, second_and_second_last_line, sliced_words, second_and_second_last_line, first_and_last_line
end



print_in_box('To boldly go where no one has gone before.')
print_in_box('To boldly go where no one has gone beforessssssssssssssssssssssssssssssssssssssssssjsjsjsjsjsjsjsjdfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjjfjfjfjfjfjjfjfjfjfjfejefjjdfjfjfsjfsjfsjfjsj.')
print_in_box('sssssssjsjsjsjsjsjsjsjdfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjfjjfj')
