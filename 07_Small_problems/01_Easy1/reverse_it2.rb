=begin

1.Understand the problem
The method takes one string containing one or more words. It returns the given string, with each word that contains more than 5 chars reversed. Spaces should be included only when more than one word is present

2.Test cases
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

3.Data structure
Words will be saved as elements of an array

4.Algorithm
Words will be saved as elements of an array. We iterate over each word to verify if it is longer than 5 characters, if true we override the current word with itw reverse, if false we do nothing. We join the words updated array, divide by a space.

=end

def reverse(words)
  collection = words.split
  collection.map! do |word|
    if word.length >= 5
      word.reverse
    else
      word
    end
  end 
  collection.join(' ')
end

puts reverse("this is a stupid test")