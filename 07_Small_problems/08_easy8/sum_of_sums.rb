=begin
1.Understand problem
Input: an array of integers
Output:an integer; the sum of the sums for each leading subsequence forthat array
Rules:
-Explicit:
-Implicit:
2.Examples
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35
3.Data structure

4.Algorithm

=end
def sum_of_sums(array)
  total = 0
  counter = array.size
  array.each do |integer|
    total += (integer * counter)
    counter -= 1 
  end
  total
end

sum_of_sums([3, 5, 2]) 
sum_of_sums([1, 5, 7, 3]) 
sum_of_sums([4]) 
sum_of_sums([1, 2, 3, 4, 5])

#textbook solution 1
def sum_of_sums(array)
  total_sum = 0
  intermediate_sum = 0
  array.each do |num|
    intermediate_sum += num
    total_sum +=  intermediate_sum
  end
  total_sum
end

sum_of_sums([3, 5, 2]) 
sum_of_sums([1, 5, 7, 3]) 
sum_of_sums([4]) 
sum_of_sums([1, 2, 3, 4, 5])

#textbook solution 2
def sum_of_sums(array)
  total_sum = 0
  array_length = array.size
  1.upto(array_length) do |num| 
    total_sum += array.slice(0, num).reduce(:+)
  end
  total_sum
end

sum_of_sums([3, 5, 2]) 

[1, 2, 3].reduce(:+)
[1, 2, 3].reduce do |memo, value|
  memo += value
end