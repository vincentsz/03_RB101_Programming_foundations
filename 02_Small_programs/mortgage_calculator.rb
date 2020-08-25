# Ask for the loan amount, store it in variable total_loan_amount, verify if input is valid, if not ask again
# Ask for the Annual Percentage Rate, store it in variable annual_percentage_rate verify if input is valid, if not ask again
# Ask for loan duration (in years), store it in variable annual_loan_duration verify if input is valid, if not ask again
# Calculate monthly interest rate by using the formula: Anual_percentage_rate / 12, stor in variable monthly interest rate
# Calculate loan duration in months by using formula: annual_loan_duration x 12, store in variable loan_duration_in_months
# Calculate monthly payment by using formula: loan_amount*(montly_interest_rate / (1 - (1+monthly_interest_rate)**(-loan_duration_in_months)))

def prompt(input)
  puts "=>#{input}"
end

def valid_amount?(amount)
  ((amount == amount.to_i.to_s) || (amount == amount.to_f.to_s)) && ((!amount.empty?) && (amount.to_f > 0))
end

def valid_percentage?(percentage)
  (((percentage.delete_suffix("%") == percentage.to_i.to_s) || (percentage.delete_suffix("%") == percentage.to_f.to_s)) && (percentage.include? "%")) && ((!percentage.empty?) && (percentage.to_f > 0))
end

loop do
  prompt("Welcome to Mortgage calculator!")

  total_loan_amount = ''
  loop do
    prompt("Please give the total loan amount: ")
    total_loan_amount = gets.chomp
    if valid_amount?(total_loan_amount)
      break
    else
      prompt("That's not a valid input, please try again!")
    end
  end

  annual_percentage_rate = ''
  loop do
    prompt("Please give the annual percentage rate (in%)")
    annual_percentage_rate = gets.chomp
    if valid_percentage?(annual_percentage_rate)
      break
    else
      prompt("That's not a valid annual percentage rate, please try again!")
    end
  end

  loan_duration = ''
  loop do
    prompt("Please give the loan duration (in years)")
    loan_duration = gets.chomp
    if valid_amount?(loan_duration)
      break
    else
      prompt("That's not a valid loan duration, please try again!")
    end
  end

  monthly_interest_rate = annual_percentage_rate.to_f / 12
  monthly_interest_rate_calculation = monthly_interest_rate / 100
  loan_duration_in_months = loan_duration.to_i * 12
  monthly_payment = total_loan_amount.to_f * (monthly_interest_rate_calculation / (1 - (1 + monthly_interest_rate_calculation)**(-loan_duration_in_months)))

  prompt("Your monthly interest rate is #{format('%.2f', monthly_interest_rate)}%")
  prompt("Your loan duration is #{loan_duration_in_months} months.")
  prompt("Your monthly payment is: #{format('%.2f', monthly_payment)}$")

  prompt("Do you want to do another calculation?(Press Y if you do)")
  answer = gets.chomp
  unless answer.downcase.include?("y")
    break
  end
end

prompt("Thank you for using Mortgage calculator")
