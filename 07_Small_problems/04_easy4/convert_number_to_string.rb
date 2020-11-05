=begin
1.Understand problem
Input: a positive integer or zero
Output: String representation of input
2.Examples
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'
3.Data structure

4.Algorithm

=end

def integer_to_string(number)
  
  collection = []
  loop do
    collection.unshift(number % 10)
    number = number / 10
    break if number == 0
  end

  collection.join
end

p integer_to_string(4321) 
p integer_to_string(0) 
p integer_to_string(5000) 


# textbook solution

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end


=begin

further exploration

mutating string methods that do not end with !:
  - <<
  -clear
  -concat
  -replace
  -insert
  -...

  mutating array methods that do not end with !:
    - <<
    - clear
    - concat
    - fill
    - replace
    - insert
    - keep if
    - push
    - append
    -...