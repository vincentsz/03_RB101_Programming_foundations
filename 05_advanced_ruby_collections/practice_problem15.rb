=begin
1.Understand problem
Input:an array containing hashes
Output:a new array containing only the hashes of the original wher all integers are even
Rules:
-Explicit:
-Implicit:
2.Examples

3.Data structure

4.Algorithm

=end


arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hash|
  hash.all? do |key, value|
    value.all? { |num| num.even? }
  end
end