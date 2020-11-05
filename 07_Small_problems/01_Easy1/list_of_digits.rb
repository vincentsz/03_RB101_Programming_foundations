def digit_list(integer)
  integer.to_s.split('').map{|x| x.to_i}
end

puts digit_list(12345) 
puts digit_list(7) 
puts digit_list(375290) 
puts digit_list(444) 

puts digit_list_bf(12345) == [1, 2, 3, 4, 5] 

def digit_list_2(integer)
  integer.digits.reverse
end

puts digit_list_2(12345) == [1, 2, 3, 4, 5] 

def digit_list_bf(integer)
  counter = 0
  array = []
  string = integer.to_s
  loop do
    array << string[counter].to_i
    counter += 1
    break if counter == string.length
  end
  array
end

puts digit_list_bf(12345) == [1, 2, 3, 4, 5]

def digit_list(number)
  digits = []
  loop do
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
    break if number == 0
  end
  digits
end

digit_list(155485)