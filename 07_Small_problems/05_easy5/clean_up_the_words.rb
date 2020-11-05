=begin
1.Understand problem
Input: a string that consists of lowercased words and an asssortment of non-alphabetic characters.
Output: A string with all non-alphabetical characters replaced by spaces
Rules: If more than one non-alphabateical character ina row, replace by just one space
2.Examples
cleanup("---what's my +*& line?") == ' what s my line '
3.Data structure

4.Algorithm
Iterate through the string. If a character is not included in a..z, replace by space. Splitstring according to spaces. Join, leving space.
=end

def cleanup(string)
  collection = string.chars.map! do |character|
    if ("a".."z").include?(character)
      character
    else
      ' '
    end
  end
  collection.join.squeeze(' ')
end

cleanup("---what's my +*& line?")

