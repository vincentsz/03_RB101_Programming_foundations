=begin
1.Understand problem
Input: any year greater than 0
Output: true when the year is a leap year, false when not
Rules: A year is a leap year when evenly divisible by 4, unless it's also evenly divisible by 100. When evenly divisible by 100, if evenly divisible by 400 irt is again a leap year.
2.Examples
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true
3.Data structure

4.Algorithm
Calculate modulo 4 of year. 
If result does not equal 0, return false. 
If result equals 0, perform modulo 100 on year.
If result does not equal 0, return true
If result equals 0, perform modulo 400 on year.
If result does not equal 0, return false
If result equals 0, return true
=end

=begin
def leap_year?(year)

  year % 4 == 0 ? year_mod_100 = year % 100 : return false
end
    year_mod_100 == 0 ? year_mod_400 = year % 400 : return true
end
      year_mod_400 == 0 ? return true : return false
end

end

=end

#my solution

def leap_year?(year)

  if year % 4 == 0
    year_mod_100 = year % 100
  else
    return false
  end

  if year_mod_100 == 0
    year_mod_400 = year % 400
  else
    return true
  end

  if year_mod_400 == 0
    return true
  else
    return false
  end

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

#textbook solution

def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
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

#textbook solution short

def leap_year?(year)
  (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
end
#the following code will fail for all years dividable by 400

def leap_year?(year)
  if year % 100 == 0
    false
  elsif year % 400 == 0
    true
  else
    year % 4 == 0
  end
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