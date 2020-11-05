=begin
1.Understand problem

2.Examples
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}

3.Data structure

4.Algorithm
Split the string into separate words, stored in an array. 
Iterate over this array. 
Count the number of characters of each element. 
Creat empty hash with 0 as default value. 
Store as a key(number of characters) - value(1).
Return hash
=end

def word_sizes(text)
  size_and_number_of_words = Hash.new(0)
  text.split.each do |word|
    word.gsub!(/[^a-z]/i, '')
    size_and_number_of_words[word.length] += 1
  end
  size_and_number_of_words
end

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}