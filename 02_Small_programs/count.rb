require "pry"

counter = 0

loop do
    counter += 1
    binding.pry
    break if counter == 5
end
array = [1, 2, 3]
array.map