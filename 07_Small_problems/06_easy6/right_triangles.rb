=begin
1.Understand problem
Input: a positive integer n 
Output: a right triangle whose sides each have n stars.
Rules:  
-Explicit: The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.
-Implicit: 
-The traingle consists of n lines of n lenghth. 
-The x-th line has n - x spaces followed by x stars.

2.Examples

3.Data structure

4.Algorithm

=end
def triangle(number)
  (1..number).each do |num|
    puts (" " * (number - num)) + ("*" * num)
  end
end

triangle(5)
triangle(9)

#further exploration upside down

def triangle(number)
  (1..number).each do |num|
    puts (" " * num) + ("*" * (number - num))
  end
end

triangle(5)
triangle(9)

#further exploration left
def triangle(number)
  (1..number).each do |num|
    puts ("*" * num) + (" " * (number - num))
  end
end

triangle(5)
triangle(9)

#further exploration upside down left

def triangle(number)
  (1..number).each do |num|
    puts ("*" * (number - num)) + (" " * num)
  end
end

triangle(5)
triangle(9)