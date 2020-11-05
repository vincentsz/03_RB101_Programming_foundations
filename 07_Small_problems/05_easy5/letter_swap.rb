=begin
1.Understand problem
Input: a string of words separated by spaces
Output: A string in which the first and last letter of every word are swapped
Rules: Every word contains at least one letter, string will always contain at least one word. Each string contains nothing but words and spaces.
2.Examples
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

3.Data structure
Each word is an element of an array.
4.Algorithm
Split the given string at each space and store each word in an array. Iterate over this array. Each first letter ges stored in a variable first, each latter letter gets stored ina variable last. 
Then, the first letter gets reassigned to variable last and the last letter gets reassigned to the variable first.
=end

def swap(sentence)
  collection = sentence.split(' ')
  collection.each do|word| 
    first = word[0]
    last = word[-1]
    word[0] = last
    word[-1] = first
  end
  collection.join(' ')
end

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

#textbook solution


def swap_first_last(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(sentence)
  collection = sentence.split(' ')
  collection.each {|word| swap_first_last(word)} 
  collection.join(' ')
end

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'