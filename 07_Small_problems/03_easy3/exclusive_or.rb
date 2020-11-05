=begin

1.understand problem
Input: 2 boolean values (true or false)
Output: 1 boolean value (true or false)
Rule: Output is true only if exactly one input value is true. Al other output is false

2. Examples
xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false

3.Data structure

4.Algorithm

=end

def xor?(a,b)
  if ((a || b) == true) && ((a && b) == false)
    true
  else 
    false
  end
end

xor?(5.even?, 4.even?) 
xor?(5.odd?, 4.odd?) 
xor?(5.odd?, 4.even?) 
xor?(5.even?, 4.odd?)