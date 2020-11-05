=begin
1.Understand problem
Input: A positive integer, which represents the year
Output: The century number followed with st, nd, rd, or th as appropriate for that number.
Rules: 
-1st, 2nd, 3rd, 4th,  .. 20th, 21st, 22nd etc 100th
-New centuries begin in years that end with 01; 

=> year / 100 if year ends by 0, result is century, otherwise add 1 to have correct century

2.Examples
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'
3.Data structure
st, nd, rd, or th is a constant array
4.Algorithm
If last number of year equals 0, century equals year / 100, otherwise, century equals (year/100)  + 1. 

If century % 1  ==  0 or  century % 100 == 4 to 19, add "th", 
if century ends on 1, add "st"
if century ends on 2, add "nd"
if century ends on 3, add "rd"

=end

def century(year)

  year % 10 == 0 ? century = (year / 100) : century = (year / 100) + 1

  if century % 10 == 0 || (4..19).include?(century % 100)
    century.to_s + "th"
  elsif century % 10 == 1
    century.to_s + "st"
  elsif century % 10 == 2
    century.to_s + "nd"
  else
    century.to_s + "rd"
  end

end

century(2000) 
century(2001) 
century(1965) 
century(256) 
century(5) 
century(10103) 
century(1052) 
century(1127) 
century(11201) 
century(1327) 

