def leading_substrings(string)
  list = []
  1.upto(string.size) do |num|
    list << string.slice(0, num)
  end
  list
end

leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

#textbook solution

def leading_substrings(string)
  result = []
  0.upto(string.size-1) do |index|
    result << string[0..index]
  end
  result
end

