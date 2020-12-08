def rotate_array(array)
  counter = 1
  rotated_array = []
  loop do
    break if counter == array.size
    rotated_array << array[counter]
    counter += 1
  end
  rotated_array << array[0]
  rotated_array
end
    

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']