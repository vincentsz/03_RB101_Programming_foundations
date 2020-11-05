=begin
1.Understand problem
Input: any year bigger than 0
Output: true when leap year, false when not
Rules: 
Before 1752: leap year when year evenly divisable by 4 (Julian Calendar)
After 1752: A year is a leap year when evenly divisible by 4, unless it's also evenly divisible by 100. When evenly divisible by 100, if evenly divisible by 400 irt is again a leap year. (Gregorian calendar)
2.Examples

3.Data structure

4.Algorithm
add an ternary statement
=end

def leap_year?(year)
  year < 1752 ? julian_calendar?(year) : gregorian_calendar?(year)
end

def gregorian_calendar?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end


def julian_calendar?(year)
    year % 4 == 0
end


leap_year?(2016) 
leap_year?(2015) 
leap_year?(2100) 
leap_year?(2400) 
leap_year?(240000) 
leap_year?(240001) 
leap_year?(2000) 
leap_year?(1900) 
leap_year?(1752) 
leap_year?(1700) 
leap_year?(1) 
leap_year?(100) 
leap_year?(400) 