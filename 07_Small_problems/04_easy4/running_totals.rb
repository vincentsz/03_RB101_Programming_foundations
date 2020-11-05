=begin
1.Understand problem
Input: an array of integers
Output: an array of integers, same number of elements as input, each element is the running total form the original
2.Examples
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []
3.Data structure

4.Algorithm
Create an empty array running_total
Iterate over input array. Add latest element of running total to current iterator. Store result is running_total
=end

def running_total(collection)
  running_total = [0]
  collection.each do |n|
    running_total << n + running_total.last
  end
   running_total.shift
   running_total
end

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

def running_total(collection)
  sum = 0
  collection.map {|n| sum += n}
end

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

#further exploration

def running_total(collection)
  sum = 0
  collection.each_with_object([]) do |n, a|
    a << sum += n
  end
end

running_total([2, 5, 13]) 
running_total([14, 11, 7, 15, 20]) 
running_total([3]) 
running_total([]) 

