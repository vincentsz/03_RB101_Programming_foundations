=begin
1.Understand problem
Input:an array of integers
Output: a float, rounded to 3 decimal places, which is the result of all the numbers from the array multiplied, divided by thenumber of entries in thearray
Rules: assume array is not empty
-Explicit:
-Implicit:
2.Examples

3.Data structure

4.Algorithm
Set variable result to 1. Iterate over array, multiplying result by each element. Divide the size of the array. Round to 3 decimals.
=end

def show_multiplicative_average(array)
  product = 1.to_f
  array.each do |num|
    product *= num
  end
  average = product / array.size
  format("%.3f", average)
end

show_multiplicative_average([3, 5])                
show_multiplicative_average([6])                   
show_multiplicative_average([2, 5, 7, 11, 13, 17])