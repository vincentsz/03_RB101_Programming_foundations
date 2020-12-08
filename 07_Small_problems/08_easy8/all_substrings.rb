def substrings(string)
  list = []
  loop do
    break if string == ''
    1.upto(string.size) do |num|
      list << string.slice(0, num)
    end
    string.reverse!.chop!.reverse! 
  end
  list
end

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

#refactored
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

substrings('abcde')