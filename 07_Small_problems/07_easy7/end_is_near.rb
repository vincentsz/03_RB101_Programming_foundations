def penultimate(string)
  string.split[-2]
end

penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

#further exploration
=begin
1.Understand problem
Input:A string, containing, no words, one words ore multiple words.
Output:The middle word
Rules:
-Explicit:
  -If a string contains an uneven amount of words, it should return the middle word.
-Edge cases:
  -If a string contains no words it should return that empty string
  -If a string contains just one word, it should return that word
  -If a string contains an even amount of words, it should return the two middle words
2.Examples
penultimate('') == ''
penultimate('word') == 'word'
penultimate('last word') == 'last word'
penultimate('last word is') == 'word'
penultimate('Launch School is great!') == 'School is'

3.Data structure

4.Algorithm
  - Set an empry array called 'result'. 
  - Split sentence into array containing individual words
  - Determine size of array.
    - If size equals 0, result equals ''
    - If size is uneven, result equals 'result[size/2]'
    - If size is even, result equals result[(size/2)-1] result[size/2]'
  join and return result

=end
def penultimate(string)
  result = []
  words = string.split
  size = words.size

  case 
    when size.zero?
      result << string
    when size.odd?
      result << words[size/2]
    when size.even?
      result << words[(size/2)-1]
      result << words[size/2]
  end

  result.join(' ')
end
penultimate('') == ''
penultimate('word') == 'word'
penultimate('last word') == 'last word'
penultimate('last word is') == 'word'
penultimate('Launch School is great!') == 'School is'