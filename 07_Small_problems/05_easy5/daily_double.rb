=begin
1.Understand problem
Input:String
Output: a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character.
2.Examples
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

3.Data structure
array
4.Algorithm
Iterate through string, splitting characters
Store each character in an empty array, unless this element equals the last character of this array.
join array
=end

def crunch(text)
  collapsed = []
  text.each_char do |char|
    collapsed << char unless char == collapsed.last
  end
  collapsed.join
end

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

#further exploration 

def crunch(text)
  collapsed = []
  text.reverse!
  loop do 
    collapsed << text[-1] unless text[-1] == collapsed.last
    text.chop!
    break if text == ''
  end
  collapsed.join
end

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

#regexp
def crunch(text)
  

