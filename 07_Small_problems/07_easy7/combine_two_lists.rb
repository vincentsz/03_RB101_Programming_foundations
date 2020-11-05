=begin
1.Understand problem
Input:two arrays of equal size
Output:a new Array that contains all elements from both Array arguments, with the elements taken in alternation
Rules:
-Explicit:You may assume that both input Arrays are non-empty, and that they have the same number of elements
-Implicit:
2.Examples
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
3.Data structure

4.Algorithm

=end
def interleave(array1, array2)
  array2.each_with_index do |element,index|
    array1.insert((index*2)+1, element)
  end
  array1
end

interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

#textbook solution
def interleave(array1, array2)
  new_collection = []
  array1.each_with_index do |element, index|
    new_collection << element << array2[index]
  end
  new_collection
end

#further exploration
def interleave(array1, array2)
  array1.zip(array2).flatten
end

interleave([1, 2, 3], ['a', 'b', 'c'])