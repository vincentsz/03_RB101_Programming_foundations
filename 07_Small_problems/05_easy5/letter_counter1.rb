=begin
1.Understand problem
Input: a string with one or more space separated words
Output: A hash that shows the number of words of different sizes, key is number of characters, value is number of words
Rulea: word = any string of characters that do not include a space
2.Examples
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

3.Data structure
String to array to hash
4.Algorithm
Split the string into separate words, stored in an array. 
Iterate over this array. 
Count the number of characters of each element. 
Creat empty hash. 
Store as a key(number of characters)- value(1) pair if key does not yet exist.
If key already exists, add 1 to the value.
Return hash
=end

def word_sizes(text)
  size_and_number_of_words = {}
  text.split.each do |word|
    if size_and_number_of_words.include?(word.length)
      size_and_number_of_words[word.length] += 1
    else
    size_and_number_of_words[word.length] = 1
    end
  end
  size_and_number_of_words
end

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

#textbook solution

def word_sizes(text)
  size_and_number_of_words = Hash.new(0)
  text.split.each do |word|
    size_and_number_of_words[word.length] += 1
  end
  size_and_number_of_words
end

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}