arr = [1, 2, 3, 4]
counter = 0

while counter < arr.size
  arr[counter] += 1
  counter += 1
end
arr
counter = 0

loop do
  counter += 1
  next if counter.odd?
  puts counter
  break if counter > 5
end

alphabet = 'abcdefghijklmnopqrstuvwxyz'
counter = 0

loop do
  break if counter >= alphabet.size
  puts alphabet[counter]
  counter += 1
end

colors = ["green", "blue", "red", "yellow"]
counter = 0

loop do
  break if counter >= colors.size
  puts "I am #{colors[counter]}"
  counter += 1
end

objects = ['hello', :key, 10, []]
counter = 0

loop do
  break if counter >= objects.size
  puts "I am a #{objects[counter].class} object"
  counter += 1
end

number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1
}

pet_type = number_of_pets.keys
counter = 0

loop do
  current_pet = pet_type[counter]
  current_number = number_of_pets[current_pet]
  puts "I have #{current_number} #{current_pet}."
  counter += 1
  break if counter >= number_of_pets.size
end