# ask for two numbers
# ask for an operation to perfomr
# perform operation on two numbers
# output result

# answer = Kernel.gets()
# Kernel.puts(answer)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

name = ''
loop do
  prompt("Welcome to Calculator! Please enter your name: ")
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("Make sure to use a valid name")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop

number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()
    if valid_number?(number1)
      break
    else
      prompt("This is not a valid number, please re-enter the number!")
    end
  end

  number2 = ''
  loop do
    
      prompt("What's the second number?")
      number2 = Kernel.gets().chomp()
      if valid_number?(number2)
        break
      else
        prompt("This is not a valid number, please re-enter the number!")
      end
    end

    operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3).include?(operator)
      break
    elsif (%w(4).include?(operator)) && (number2.to_i != 0)
      break
    elsif (%w(4).include?(operator)) && (number2.to_i == 0)
      prompt("You can't' divide by zero! You must choose 1, 2 or 3")
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using Calculator!")
