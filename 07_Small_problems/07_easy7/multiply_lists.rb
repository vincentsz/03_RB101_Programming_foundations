def multiply_list(array1, array2)
 multiples = []
 array1.each_with_index do |num, index|
  multiples << num * array2[index]
 end
 multiples
end

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

def multiply_list(array1, array2)
  array1.zip(array2).map { |arr| arr.reduce(:*) }
end

multiply_list([3, 5, 7], [9, 10, 11])