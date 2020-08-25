# ask for two numbers
# ask for an operation to perfomr
# perform operation on two numbers
# output result

# answer = Kernel.gets()
# Kernel.puts(answer)

loop do
puts "Set your language: (en or ned)"
LANGUAGE = gets.chomp
  if LANGUAGE == "en" || LANGUAGE == "ned"
    break
  else
    puts "Incorrect language, please try again:"
  end
end


require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(input)
  integer?(input) || float?(input)
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def  number?(num)
  num.to_f.to_s == num
end

def operation_to_message(op)
  operation = case op
              when '1'
                'Adding'
              when '2'
                'Subtracting'
              when '3'
                'Multiplying'
              when '4'
                'Dividing'
              end
  1+1
  operation
end

name = ''
loop do
  prompt(messages('welcome', LANGUAGE))
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(messages('valid_name', LANGUAGE))
  else
    break
  end
end

prompt(messages('greeting', LANGUAGE)+" #{name}!")

loop do # main loop

  number1 = ''
  loop do
    prompt(messages('first_number', LANGUAGE))
    number1 = Kernel.gets().chomp()
    if valid_number?(number1)
      break
    else
      prompt(messages('unvalid_number', LANGUAGE))
    end
  end

  number2 = ''
  operator = ''
  loop do
    loop do
        prompt(messages('second_number', LANGUAGE))
        number2 = Kernel.gets().chomp()
        if valid_number?(number2) 
          break
        else
          prompt(messages('unvalid_number', LANGUAGE))
        end
    end

    operator_prompt = <<-MSG
      What operation would you like to perform?
      1) add
      2) subtract
      3) multiply
      4) divide
    MSG

      loop do 
        prompt(operator_prompt)
        operator = Kernel.gets().chomp()
          if %w(1 2 3 4).include?(operator)
            break
          else
            prompt(messages('unvalid_operator', LANGUAGE))
          end
      end

    if (%w(4).include?(operator)) && (number2.to_i == 0)
      prompt (messages('unvalid_zero', LANGUAGE))
    else
      break
    end
  end

  prompt("#{operation_to_message(operator)}" + messages('operator_confirmation', LANGUAGE))

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

  prompt(messages('result', LANGUAGE)+ "#{result}")

  prompt(messages('restart_calculation', LANGUAGE))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(messages('thank_you', LANGUAGE))
