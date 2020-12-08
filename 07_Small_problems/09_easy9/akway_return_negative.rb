def negative(integer)
  if integer > 0
    -integer
  else
    integer
  end
end

negative(5) == -5
negative(-3) == -3
negative(0) == 0

#refactored

def negative(integer)
  integer > 0 ? -integer : integer
end

negative(5) == -5
negative(-3) == -3
negative(0) == 0

def negative(number)
  -number.abs
end

negative(5) == -5
negative(-3) == -3
negative(0) == 0