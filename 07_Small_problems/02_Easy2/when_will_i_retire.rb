=begin

1.Understand problem
Input:
User age
User retirement age. 
Current year. 
Output:
Retirement year. 
Years to work.
Model the problem:
Calculate  years to work by subtracting age from retirement age. Add these years to current year to find retirment year.

2.Examples
age = 30, retirement_age = 70 => year_to_work = 40 , retirment year = 2060

3. Data structure

4.Algorithm
Retrieve:
-User age
-User retirement age. 
-Current year. 
Output:
Retirement year. 
Years to work.
Model the problem:
Calculate  years to work by subtracting age from retirement age. Add these years to current year to find retirment year.

=end

puts "What is your age?"
current_age = gets.chomp
puts "At what age would you like to retire?"
retirement_age = gets.chomp

current_time = Time.new
current_year = current_time.year

years_to_work = retirement_age.to_i - current_age.to_i
retirement_year = current_year + years_to_work


puts "It's #{current_year}. You will retire in #{retirement_year}"
puts "You only have #{years_to_work} years of work to go!"
