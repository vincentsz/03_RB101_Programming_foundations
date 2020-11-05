=begin
1.Understand problem
Input:
Output:
Rules:
-Explicit:
-Implicit:
2.Examples

3.Data structure

4.Algorithm

=end

def merge(array_a, array_b)
  new_array = array_a.dup
  array_b.each do |element|
    new_array << element
  end
  new_array.uniq!
end

merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

def merge(array1, array2)
  (array1 + array2).uniq
end

merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]