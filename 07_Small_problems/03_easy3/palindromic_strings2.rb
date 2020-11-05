=begin
1.Understand problem
Input: a string of one or more words
Output: a boolean, true if the string is a palindrome, false if not
Rules: case insensitive, all non-alphanumeric chars should be ignored
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

def real_palindrome?(words)
  words.downcase!
  characters = words.split('')
  alphanumeric_characters = []
  range_letters = ("a".."z")
  range_numbers = (0..9)
  loop do
    current = characters.shift
    if range_letters.include?(current) || range_numbers.include?(current)
      alphanumeric_characters << current
    end
    break if characters == []
  end
  p alphanumeric_characters == alphanumeric_characters.reverse
end

real_palindrome?('madam') 
real_palindrome?('Madam') 
real_palindrome?("Madam, I'm Adam") 
real_palindrome?('356653') 
real_palindrome?('356a653') 
real_palindrome?('123ab321') 