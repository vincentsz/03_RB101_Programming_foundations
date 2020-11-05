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

def reverse(collection)
  new_collection = []
  counter = collection.size

  loop do
    break if counter == 0
    counter -= 1
    new_collection << collection[counter]
  end

  new_collection
end

reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true


#textbook_solution
def reverse(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end

#further_exploration (each_with_object)
def reverse(array)
  array.each_with_object([]) do |element, collection|
    collection.unshift(element)
    collection
  end
end

#further_exploration (inject)
def reverse(array)
  array.inject([]) do |collection, element|
    collection.unshift(element)
    collection
  end
end

reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true
