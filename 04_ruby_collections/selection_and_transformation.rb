produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(prod)
  selection = {}
  prod.select do |k,v|
    if v == 'Fruit'
      selection[k] = v
    end
  end
end


select_fruit(produce)

# with a loop
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(prod)
  produce_keys = prod.keys
  selected_fruits = {}
  counter = 0

  loop do

    break if counter == produce_keys.size

    current_key = produce_keys[counter] 
    current_value = prod[current_key] 

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1 
  end

  selected_fruits
end

select_fruit(produce)

#double numbers
def double_numbers(num)
  counter = 0
  double_numbers = []

  loop do
    break if counter == num.size

    current_number = num[counter]
    double_numbers <<  current_number * 2
    
    counter += 1
  end
double_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers(my_numbers)

#double numbers!
def double_numbers!(num)
  counter = 0

  loop do
    break if counter == num.size

    num[counter] *= 2
    
    counter += 1
  end
num
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers!(my_numbers)

def double_odd_numbers(num)
  double_odd_num = []
  counter = 0

  loop do
    break if counter == num.size

    current_number = num[counter]
    current_number *= 2 if counter.odd?
    double_odd_num << current_number
    
    counter += 1
  end
  double_odd_num
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_numbers(my_numbers)

# more flexible methods

def general_select(produce_list, selection_criteria)
  produce_keys = produce_list.keys
  counter = 0
  selected_produce = {}

  loop do 
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == selection_criteria
      selected_produce[current_key] = current_value
    end
  
  counter += 1
  end

  selected_produce
end

produce = {
  'apple' => 'Fruit',
  'banana' => 'Fruit',
  'broccoli' => 'Vegetable'
}

general_select(produce, 'Fruit')

# double numbers updated
my_numbers = [1, 4, 3, 7, 2, 6]

def multiply(numbers, multiplier)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    multiplied_numbers << numbers[counter] * multiplier
    counter += 1
  end

  multiplied_numbers
end

multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]

# select letter
question = 'How many times does a particular character appear in this sentence?'

def select_letter(sentence, character)
  selected_chars = ''
  counter = 0

  loop do
    break if counter == sentence.size
    current_char = sentence[counter]

    if current_char == character
      selected_chars << current_char
    end

    counter += 1 
  end

  selected_chars
end

select_letter(question, 'a').size
select_letter(question, 't').size
select_letter(question, 'z').size


# for loop

alpahabet = 'abcdefghijklmnopqrstuvwxyz'

for char in alphabet.chars
  puts char
end
