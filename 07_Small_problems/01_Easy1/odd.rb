def is_odd?(integer)
  integer % 2 != 0
end
 
puts is_odd?(2)
puts is_odd?(5)    
puts is_odd?(-17)  
puts is_odd?(-8)   
puts is_odd?(0)    
puts is_odd?(7)    


def is_odd?(integer)
  integer.remainder(2) != 0
end
 
puts is_odd?(2)
puts is_odd?(5)    
puts is_odd?(-17)  
puts is_odd?(-8)   
puts is_odd?(0)    
puts is_odd?(7)    