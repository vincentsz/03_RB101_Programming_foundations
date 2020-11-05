=begin
1.Understand problem
Input:An integer, representing a number of digits
Output:An integer, representing the index of the first Fibonacci number that has the number of digits as specified by input
Rules: 
-Explicit:
  -Fibonacci series is a series of numbers wheryby first two numbers are 1, each subsequent number is the sum of the two previous numbers
  -we assume the argument is always greater than or equal to two
-Implicit:
2.Examples
find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

3.Data structure
Define a array [1, 1]. Iterate over array, adding the last numbers to each other and store it in the original array. 
4.Algorithm

=end
def find_fibonacci_index_by_length(fibonaci_length)
  fibonaci_sequence = [1, 1]

  loop do
    next_number = fibonaci_sequence[-1] + fibonaci_sequence[-2]
    fibonaci_sequence << next_number
    break if next_number.to_s.size >= fibonaci_length
  end
  fibonaci_sequence.size
end

find_fibonacci_index_by_length(2) == 7          
find_fibonacci_index_by_length(3) == 12         
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847