=begin

1.Understand problem
Input: two positive integers
Output: following operations and its result: addition, subtraction, product, quotient, remainder, and power

2.Examples
==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103

3.Data structure
4.Algorithm
Retrieve positive_integer1. Convert to integer. Retrieve positive_integer2. Convert to integer. Calculate and store addition, subtraction, product, quotient, remainder, and power. Display results

=end

def prompt(text)
  puts ">>#{text}"
end

def calculate_addition(n1, n2)
  result = (n1 + n2).round(2)
  prompt("#{n1} + #{n2} = #{result}")
end

def calculate_subtraction(n1, n2)
  result = (n1 - n2).round(2)
  prompt("#{n1} - #{n2} = #{result}")
end

def calculate_product(n1, n2)
  result = (n1 * n2).round(2)
  prompt("#{n1} * #{n2} = #{result}")
end

def calculate_quotient(n1, n2)
  if n2  == 0
  prompt("You can't divide by zero!")
  else
  result = (n1 / n2).round(2)
  prompt("#{n1} / #{n2} = #{result}")
  end
end

def calculate_remainder(n1, n2)
  if n2 == 0
  prompt("The remainder can't be zero!")
  else
  result = (n1 % n2).round(2)
  prompt("#{n1} % #{n2} = #{result}")
  end
end

def calculate_power(n1, n2)
  result = (n1 ** n2).round(2)
  prompt("#{n1} ** #{n2} = #{result}")
end

prompt("Enter the first number:")
number1 = gets.chomp.to_f

prompt("Enter the second number:")

number2 = gets.chomp.to_f

calculate_addition(number1, number2)
calculate_subtraction(number1, number2)
calculate_product(number1, number2)
calculate_quotient(number1, number2)
calculate_remainder(number1, number2)
calculate_power(number1, number2)
