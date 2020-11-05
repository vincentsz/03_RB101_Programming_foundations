def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

# error is raised because you cannot divide by 0, infinity loop is created when number is negative, it continues to count downwords, never reaching0 and thius breaking the loop
 # Bonus 1 : number % divisor == 0 returns true if result of the division has no remainder =integer number
 # Bonus 2: Returns the array factors when the loop is done

 def factors(number)
  divisor = number
  factors = []
  loop do
    break if number <= 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
    break if divisor == 0
  end
  factors

end

factors(0)
factors(-4)
factors(4)

def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

factors(0)
factors(-4)
factors(4)
factors(7)