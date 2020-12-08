def sequence(integer)
  integer > 0 ? (1..integer).to_a : (integer..-1).to_a
end

sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]
sequence(-1) == [-1]
sequence(-5) == [-5, -4, -3, -2, -1]