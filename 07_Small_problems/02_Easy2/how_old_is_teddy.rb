=begin
1.Understand problem
Generate a random integer between 20 and 200. Print it tyo the screen.
2.Test case
Teddy is 69 years old!
3.Data structure
Create an array of integers between 20 and 200
4.Algorithm
Create an array of integers between 20 and 200. Sample a random value and print to screen

=end

def random_age
  puts "Please give your name:"
  name = gets.chomp

  if name == ''
    name = 'Teddy'
  end

  sample = 20..200
  ages = []

  sample.each do |n|
    ages << n
  end

"#{name} is #{ages.sample} years old!"

end

p random_age