=begin

1.Understand problem
Input:array
Output: array of each element at even index of given array

2.Examples
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []

3.data structure
array

4.Algorithm

Iterate with index over array, if index is even, save to new array

=end

def oddities(array)
  even_index = []
  array.each_with_index do |element, index|
    if index.even?
      even_index << element
    end
  end
  even_index
end

def oddities(array)
  even_index = []
  index = 0
  while index < array.size
    even_index << array[index]
    index += 2
  end
  even_index
end

def oddities(array)
  even_index = []
  loop do
    even_index << array.shift
    array.shift
    break if array == []
  end
  even_index
end

oddities([2, 3, 4, 5, 6]) 
oddities([1, 2, 3, 4, 5, 6]) 
oddities(['abc', 'def']) 
oddities([123]) 
oddities([]) 