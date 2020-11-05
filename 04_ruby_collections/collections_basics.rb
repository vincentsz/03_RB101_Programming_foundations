str = 'The grass is green'
str[4,5]

hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot', 'fruit' => 'pear' }
country_capitals = { uk: 'London', france: 'Paris', germany: 'Berlin' }
country_capitals.values[0]
hsh = { :a => 1, 'b' => 'two', :c => nil }
hsh[:a]
hsh['c']
hsh.fetch(:a)
hsh.fetch('c')
str = "How do you get to Carnegie HALL?"
arr = str.split
arr.join
str = "How do you get to Carnegie HALL?"
arr = str.split
arr.join(' ')
hsh.to_a
hsh = { sky: "blue", grass: "green" }
hsh.to_a

arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]
arr.to_h

str = "joe's favorite color is blue"
str[0], str[6], str[15], str[21], str[24] = 'J', "F", "C", "I", "B"
str

str = "joe's favorite color is blue"
arr = str.split
str = arr.each { |w| w.capitalize!}.join(' ')
str

arr = [1, 2, 3, 4, 5]
arr[0] += 1
arr[1] += 1
arr[2] += 1
arr[3] += 1
arr[4] += 1
arr

hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
f = "Fruit"
v = "Vegetable"
hsh[:apple] = f
hsh[:carrot] = v
hsh[:pear] = f
hsh[:broccoli] = v
hsh

