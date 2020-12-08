#best practice
def remove_evens!(arr)
  arr_clone = arr.dup
  arr_clone.each do |num|
    if num % 2 == 0
      arr.delete(num)
    end
  end
  arr
end

p remove_evens!([1,1,2,3,4,6,8,9])