=begin
1.Understand problem

2.Examples
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

3.Data structure

4.Algorithm

=end

def signed_integer_to_string(number)

  if number < 0 
    temp_number = number * -1
  else
    temp_number = number
  end

  
  collection = []
  loop do
    collection.unshift(temp_number % 10)
    temp_number = temp_number / 10
    break if temp_number == 0
  end

  if number < 0 
    "-" + collection.join
  elsif number > 0
    "+" + collection.join
  else
    collection.join
  end

end

signed_integer_to_string(4321) 
signed_integer_to_string(-123)
signed_integer_to_string(0) 

#textbook solution

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


def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)} "
  else          integer_to_string(number)
  end
end

#further exploration

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

def signed_integer_to_string(number)
  symbol = number > 0 ? '+' : number < 0 ? '-' : ''

  symbol + integer_to_string(number.abs)
end

signed_integer_to_string(4321) 
signed_integer_to_string(-123)
signed_integer_to_string(0) 