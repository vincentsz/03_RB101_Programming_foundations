=begin
1.Understand problem
Input:nested array
Output:a new nested array with subarrays orderedin descending order
Rules:
-Explicit:
-Implicit:
2.Examples

3.Data structure

4.Algorithm

=end

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |collection|
  collection.sort do |a, b|
    b <=> a
  end
end