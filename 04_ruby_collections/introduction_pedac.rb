=begin
1.Understand problem
Input: string, uniterrupted by spaces
Output: Array of substrings from a given string, which are palindromes
Rules:
-Explicit: 
- A palindrome is word that is the same when spelled backwards
-Palindrome words are case sensitive
-Implicit:
-Empty input returns an empty array
-A palindrome has more than one character
2.Examples

3.Data structure
Array
4.Algorithm
substrings method
=================
- create an empty array called 'result' that will contain all required substrings
-create a 'starting_index' variable (0) for the staring index of a substring
-start a loop that iterates over 'starting_index' from '0' to the length of the string -2
  -create a 'num_chars' variable (2) for the length of a substring
  -start an inner loop that iterates over 'num_chars' from '2' to 'string.length - starting_index'
    -extract a substring of length 'num_chars' from 'string' starting at 'starting_index'
    -append the extracted substring to the 'result' array
    -increment the 'num_chars' variable by '1'
  -end the inner loop
  -incerement the 'starting_index' variable by '1'
-end the outer loop
-return the 'result' array

pseudocode:
START

  /* Given a string named 'string */'

  SET result = []
  SET starting_index = 0

  WHILE starting_index <= length of string - 2
    SET num_chars = 2
    WHILE num_chars <= length of string - starting index
      SET substring = num_chars characters from string starting at index starting_index
      append substring to result array
      SET num_chars = num_chars + 1

    SET starting_index = starting_index +1

  RETURN result

END

is_palindrome? method
=====================
- Inside the 'is_palindrome?' method, check whether the string
vlue is equal to its reverse value. String#reverse

palindrome_substrings method
============================
-initialize a result variable to an empty array
-create an array named substring_arr that contains all of the substrings of the input string that are at least 2 characters long
-loop through the words in the substring_arr array
-if the word is a palindrome, append it to the result array
-return the result array

=end

def is_palindrome?(str)
  return str == str.reverse
end

def substrings(str)
  result = []
  starting_index = 0

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

def palindrome_substrings(string)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

p palindrome_substrings("supercalifragilisticexpialidocious"); # ["ili"]
p palindrome_substrings("abcddcbA");   # ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome"); # []
p palindrome_substrings("");           # []

def sequence(num)
  num * ((num ** 2) + 1)
end

sequence(3)
sequence(5) 


