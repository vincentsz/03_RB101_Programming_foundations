=begin
1.Understand problem
Input: 2 integers
Output: all the integers between and including the input integers, if a number is divisible by 3 and 5 print 'Fizzbuzz', if a number is dividible by 3, prin 'Fizz', if a number is dividable by 5, print 'Buzz'
Rules:
-Explicit:
-Implicit:
2.Examples

3.Data structure
an array of all integers between input
4.Algorithm
Set variable 'all_integers' to array containing all integers. 
Iterate through this array, create a new array where integers or string are added through conditional logic. 
Iterate through this array, printing each value, divided by a ','
=end

def fizzbuzz(num1, num2)
   collection_fizzbuzz = []
   (num1..num2).each do |num|
    if num % 3 == 0 && num % 5 == 0
      collection_fizzbuzz << 'Fizzbuzz'
    elsif num % 3 == 0
      collection_fizzbuzz << 'Fizz'
    elsif num % 5 == 0
      collection_fizzbuzz << 'Buzz'
    else
      collection_fizzbuzz << num
    end
  end
  collection_fizzbuzz.each_with_index do |element, index| 
    print element
    print ', ' unless index >= collection_fizzbuzz.size - 1
  end
end

fizzbuzz(1, 15) 


#refactored

def fizzbuzz(num1, num2)
  collection_fizzbuzz = []
  num1.upto(num2) do |num|
    collection_fizzbuzz << result_fizzbuzz(num)
  end
  puts collection_fizzbuzz.join(', ')
end

def result_fizzbuzz(num)
  case
  when num % 3 == 0 && num % 5 == 0
    'Fizzbuzz'
  when num % 3 == 0
    'Fizz'
  when num % 5 == 0
    'Buzz'
  else
    num
  end
end

fizzbuzz(1, 15) 