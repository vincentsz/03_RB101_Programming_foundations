=begin
1.Understand problem
Input:a nested array containing integers
Output:a new array identical i structure, but containing only integers that are multiples of 3
Rules:use either select or reject
-Explicit:
-Implicit:
2.Examples

3.Data structure

4.Algorithm

=end

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |array|
  array.select do |num|
    num % 3 ==0
  end
end