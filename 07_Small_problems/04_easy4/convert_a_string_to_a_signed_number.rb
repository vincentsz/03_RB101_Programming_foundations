=begin
1.Understand problem
Input: a string representing an integer,  preceded by -, + or no symbol
Output: When input is preceded by + or nothing, the integer, when input is preced by -, the integer prced by -
2.Examples
string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100
3.Data structure

4.Algorithm
If string includes - or +, iterate over characters and
=end

def string_to_integer(number)
  reference_hash = {"0"=>0, "1"=>1, "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9}
  
  current = number.chars.map! do |n|
    reference_hash[n]
  end

  sum = 0
  current.reverse!.each_with_index do |n, i|
    sum += n * (10**i)
  end
  sum
end

def string_to_signed_integer(number)
  if number.include?("-")
    negative_number = number.delete("-")
    - string_to_integer(negative_number)
  elsif number.include?("+")
    positive_number = number.delete("+")
    string_to_integer(positive_number)
  else
    string_to_integer(number)
  end

end

string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100

#textbook solution

def string_to_signed_integer(number)
  case number[0]
  when '-' then -string_to_integer(number[1..-1])
  when '+' then string_to_integer(number[1..-1])
  else          string_to_integer(number)
  end
end

#further exploration
DIGITS = {"0"=>0, "1"=>1, "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9}

def string_to_integer(number)
  current = number.chars.map! do |n|
    DIGITS[n]
  end

  sum = 0
  current.reverse!.each_with_index do |n, i|
    sum += n * (10**i)
  end
  sum
end


#further exploration
def string_to_signed_integer(number)
DIGITS.has_key?(number[0]) ? result = string_to_integer(number) : result  = string_to_integer(number[1..-1])
number.include?("-") ? -result : result
end
 
p string_to_signed_integer('4321') 
p string_to_signed_integer('-570') 
p string_to_signed_integer('+100') 