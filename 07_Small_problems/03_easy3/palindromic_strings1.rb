=begin
1.Understand problem
Input: a string of one or more words
Output: a boolean, true if the string is a palindrome, false if not
Rules: case, punctiation and spaces matter
2.Examples
palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true
3.Data structure
array
4.Algorithm
-Split the given string in individual characters, save those characters to an array. 
-Save a copy. 
-Iterate over the array, deleting the last character and saving it to a new array. 
-Compare original to new array.
=end

def palindrome?(words)
  characters = words.split('')
  copy_characters = characters.clone
  reverse_characters = []
  loop do
    reverse_characters << copy_characters.pop
    break if copy_characters == []
  end
  characters == reverse_characters
end



palindrome?('madam') 
palindrome?('Madam') 
palindrome?("madam i'm adam") 
palindrome?([3, 5, 6, 6, 5, 3]) 

def palindrome?(words)
  words == words.reverse
end

palindrome?('madam') 
palindrome?('Madam') 
palindrome?("madam i'm adam") 
palindrome?([3, 5, 6, 6, 5, 3]) 