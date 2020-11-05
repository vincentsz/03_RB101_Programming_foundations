=begin

1.Understand problem
Input:
-integer greater than 0
-sum or product
Output:
-sum of all integers between 1 and entered integer
2.Examples
sum(3)=> 6
product(3)=> 6
sum(2)=> 3
product(2)=> 2
3.Data structure
Array of integers
4.Algorithm
Retrieve integer. Retrieve option "sum" or "product". Save range of 1 to integer in an array. If option "sum" is chosen add all elements of array. If option "product" is chosen multipy all elements of array. Display result.

=end

def prompt(text)
  puts ">>#{text}"
end

def retrieve_integer
  integer = ''
  loop do
    prompt("Please enter an integer greater than 0:")
    integer = gets.chomp
    break if integer.to_i.to_s == integer && integer.to_i > 0
    prompt ("Invalid choice!")
  end
  integer.to_i
end

def retrieve_choice
  option = ''
  loop do
    prompt("Please enter 's' to compute the sum, 'p' to compute the product.")
    option = gets.chomp
    break if option == 's' || option == 'p'
    prompt ("Invalid choice!")
  end
  option
end

def integer_to_array(i)
  range = (1..i).to_a
end

def calculation(r,c)
  if c == "s"
    r.inject(:+)
  else
    r.inject(:*)
  end
end

def display_result(r,c,i)
  if c == "s"
    prompt("The sum of the integers between 1 and #{i} is #{r}.")
  else
    prompt("The product of the integers between 1 and #{i} is #{r}.")
  end
end

integer = retrieve_integer
choice = retrieve_choice
range = integer_to_array(integer)
result = calculation(range, choice)
display_result(result,choice,integer)
