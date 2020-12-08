def multiply_all_pairs(arr1, arr2)
  result = []
  counter = 0
  loop do
    arr2.each do |num|
      result << num * arr1[counter]
    end
    counter += 1
    break if counter == arr1.size
  end
  result.sort
end

multiply_all_pairs([2, 4], [4, 3, 1, 2])

#textbook solution

def multiply_all_pairs(arr1, arr2)
  result = []
  arr1.each do |num1|
    arr2.each do |num2|
      result << num1 * num2
    end
  end
  result.sort
end

multiply_all_pairs([2, 4], [4, 3, 1, 2])