=begin

1.Understand problem
Input: a word or multiple words
Output: The number of characters of the word or multiple words
Rules: spaces are not counted

2.Examples
Please write word or multiple words: walk => There are 4 characters in "walk".

3.Data structure
array of words, flattened to an array of letters

4.Algorithm
Retrieve word or multiple words. Store words in array. Flatten array. Count characters. Display count

=end

def prompt(text)
  puts ">> #{text}"
end

prompt("Please write word or multiple words: ")
words = gets.chomp

collection = words.split.join
count = collection.size

prompt("There are #{count} characters in #{words}")