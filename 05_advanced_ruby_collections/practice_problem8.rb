=begin
1.Understand problem
Input: hash, key-value pairs are symbol and array of strings, array consits of unequal elements
Output: all of the vowels ("aeiou") from the strings
Rules:use each method
-Explicit:
-Implicit:
2.Examples

3.Data structure

4.Algorithm

=end

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}


hsh.each_value do |words|
  words.each do |word|
    word.split('').each do |letter|
      puts letter if ("aeiou").include?(letter)
    end
  end
end
