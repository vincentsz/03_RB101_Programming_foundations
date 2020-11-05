# understand problem
# - explit requirements:
#   - a string as input
#   - a positive integer as input
#   - a string as output
# - implict requirements:
#   - none?
# - rules:
#   - the given string, printed as many times as the given positive integer
# examples
# repeat('Hello',3)
#Hello
#Hello
#Hello
#Data structure
# - a (verified) string as input
# - a (verified) positive integer as input, converted from a string
#Algoritm
#Print the given string times the positive integer

def prompt(message)
  puts "=>#{message}"
end

def retrieve_text
text = ''
  loop do
    prompt("Which text do you want to print?")
    text = gets.chomp
    if text == '' 
      prompt("Invalid input, please enter your text!")
    else
      break
    end
  end
text
end
 
def retrieve_number
number = ''
  loop do
    prompt("How many times do you want to print it?")
    number = gets.chomp
    if number.to_i.to_s == number && number.to_i > 0
      break
    else
      prompt("Invalid input, please re-enter your number")
    end
  end
number
end

def convert_times(input)
  input.to_i
end

def print_times(input_text, integer)
  integer.times {puts(input_text)}
end

text = retrieve_text
times = retrieve_number
times = convert_times(times)
print_times(text, times)
