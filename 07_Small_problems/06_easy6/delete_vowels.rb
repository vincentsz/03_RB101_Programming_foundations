=begin
1.Understand problem
Input:An array of strings
Output:An array of the same string values, without the vowels
Rules:
-Explicit:
-Implicit:A new array is created
2.Examples
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
3.Data structure

4.Algorithm
Iterate of array. For each element, delete the vowels. Store modifoed string en new array.
=end

def remove_vowels(words)
  words.map do |word|
    word.delete("/[aeiouAEIOU]/")
  end
end


remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

def remove_vowels(words)
  words.map do |word|
    word.gsub(/[aeiou]/i, '')
  end
end

remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
