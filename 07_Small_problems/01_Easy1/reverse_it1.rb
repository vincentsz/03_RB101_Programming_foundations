=begin

1.Understand problem
Input is string of words, output is string of those words in reverse order
Rules: a word is delimited by spaces
2. Test cases
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
3.Data structure
The string will be converted to an array where each word is an element of this array
4.Algorithm
The string will be converted to an array where each word is an element of this array. This array will be reversed. We join this array, separated by a space, into a string. The string is printed

=end

def reverse_sentence(sentence)
  words = sentence.split(' ')
  words.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'