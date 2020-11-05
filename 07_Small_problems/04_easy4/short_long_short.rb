=begin
1.Understand problem
Input: two strings of unequal length
Output: One string; the shorter, the longer and the shorter string again.
2.Examples
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"
3.Data structure
strings
4.Algorithm
Count symbols of string_1 , save this integer to a length_1. Count symbols of string_2 , save this integer to a length_2. 
If length_1 > length_2 Then string_1 = longest_string & string_2 = shortest_string. Otherwise, string_1 = shortest_string & string2 = longest_string. 
Return shorter_string + longer_string + shorter string
=end

def short_long_short(string_1, string_2)
length_1 = string_1.size
length_2 = string_2.size

longest_string = ''
shortest_string = ''

if length_1 > length_2
  longest_string = string_1 
  shortest_string = string_2
else
  shortest_string = string_1
  longest_string = string_2
end

return shortest_string + longest_string + shortest_string

end


short_long_short('abc', 'defgh') 
short_long_short('abcde', 'fgh')
short_long_short('', 'xyz') 

#shorter version

def short_long_short(string1, string2)
  if string1.size > string2.size
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end

#ternary operator

def short_long_short(string1, string2)
  string1.size > string2.size ? string2 + string1 + string2 : string1 + string2 + string1
end

short_long_short('abc', 'defgh') 
short_long_short('abcde', 'fgh')
short_long_short('', 'xyz') 