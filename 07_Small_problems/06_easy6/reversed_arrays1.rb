=begin
1.Understand problem
Input: An array containing elements(any kind)
Output: The original array, modified so that it's elements are in reverse order
Rules:
-Explicit:Do not use Array#reverse or Array#reverse!
-Implicit:
2.Examples
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"]
list == ["c", "d", "e", "b", "a"]

list = ['abc']
reverse!(list) == ["abc"]
list == ["abc"]

list = []
reverse!(list) == []
list == []
3.Data structure

4.Algorithm

=end

def reverse!(collection)
  counter = 0

  loop do
    break if counter >= collection.size
    collection.insert(counter, collection.pop)
    counter += 1
  end

  collection
end

list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"]
list == ["c", "d", "e", "b", "a"]

list = ['abc']
reverse!(list) == ["abc"]
list == ["abc"]

list = []
reverse!(list) == []
list == []

#textbook solution

def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index] , array[left_index)]
    left_index += 1
    right_index -= 1
  end

  array
end

