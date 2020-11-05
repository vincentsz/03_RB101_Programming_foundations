=begin
1.Understand problem
Input: an integer greater than 1
Output: The sum of all multiples of 3 or 5 that lie between 1 and the input number.
2.Examples
multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168
3.Data structure
all multiples of 3 and 5 will be saved in an array
4.Algorithm
Iterate over the range form 1 to input. Each integer that returns true for modulo 3 or modulo 5 equaling 0 will be saved into an array. 
Doubles will be deleted. 
Iterate over array adding all elements. 
Return result
=end

def multisum(integer)
  multiples = []
  (1..integer).each do |i|
    if (i % 3 == 0) || (i % 5 == 0)
      multiples << i
    end
  end

  multiples.sum

end


multisum(3) 
multisum(5) 
multisum(10) 
multisum(1000) 

#further exploration

def multisum(integer)
  (1..integer).inject(0) do |sum, n|
     if (n % 3 == 0) || (n % 5 == 0) 
      sum + n 
     else 
      sum
     end
  end
end

multisum(3) 
multisum(5) 
multisum(10) 
multisum(1000) 

