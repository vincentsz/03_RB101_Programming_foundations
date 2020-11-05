=begin

1.Understand problem
Input: 6 numbers
Output: A message indicating if the last number is featured in the first 5 numbers

2.Examples
==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].


==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].

3.Data structure
Numbers will be stored in an array

4.Algorithm
Retrieve first number, convert to integer and save to array numbers.
Retrieve second number, convert to integer and save to array numbers.
Retrieve third number, convert to integer and save to array numbers.
Retrieve fourth number, convert to integer and save to array numbers.
Retrieve fifth number, convert to integer and save to array numbers.
Retrieve last number, convert to integer and save to array numbers.

If the la

=end

def prompt (text)
  puts ">>#{text}"
end

array = []

prompt("Enter the 1st number:")
array << gets.chomp.to_i

prompt("Enter the 2nd number:")
array << gets.chomp.to_i

prompt("Enter the 3rd number:")
array << gets.chomp.to_i

prompt("Enter the 4th number:")
array << gets.chomp.to_i

prompt("Enter the 5th number:")
array << gets.chomp.to_i

prompt("Enter the last number:")
last_number = gets.chomp.to_i

if array.include?(last_number)
  puts "The number #{last_number} appears in #{array}."
else
    puts "The number #{last_number} does not appear in #{array}."
end