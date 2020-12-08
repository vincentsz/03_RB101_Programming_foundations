=begin
1.Understand problem
Input: a string
Output: an array containg all substrings of a string tht are palindromic
Rules:
-Explicit:
  -return values in same sequence as substrings apear in string
  -duplicate palindromes should be included multiple times
  -use existing 'substrings' method
  -single characters are not palindromes
-Implicit:
2.Examples

3.Data structure

4.Algorithm

=end

def ignore_case(string)
  string.downcase
end

def ignore_non_alpha(string)
  string = ignore_case(string)
  string.gsub(/[^0-9a-z]/, '')
end

def leading_substrings(substring)
  list = []
  1.upto(substring.size) do |num|
    list << substring.slice(0, num)
  end
  list
end

def substrings(string)
  final = []
  0.upto(string.size-1) do |num|
    substring = string[num..-1]
    final.concat(leading_substrings(substring))
  end
  final
end

def palindrome?(this_test)
  (this_test == (this_test.reverse)) && (this_test.size > 1)
end

def palindromes(this_string)
  this_string = ignore_non_alpha(this_string)
  collection = []
  substrings(this_string).each do |test|
    collection << test if palindrome?(test)
  end
  collection
end




palindromes('abcd') 
palindromes('Madam') 
palindromes('hello-madam-did-madam-goodbye')
palindromes('knitting cassettes')


