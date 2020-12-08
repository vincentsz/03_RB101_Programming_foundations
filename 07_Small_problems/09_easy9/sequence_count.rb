def sequence(count, start)
  (1..count).map do |num|
    start * num
  end
end

sequence(5, 1) 
sequence(4, -7) 
sequence(3, 0)
sequence(0, 1000000) 

