[2, 5, 4, 6, 1].sort
"b".ord

[2, 5, 3, 4, 1].sort do |a, b|
  puts "a is #{a} and b is #{b}"
  a <=> b
end
# a is 2 and b is 5
# a is 5 and b is 3
# a is 2 and b is 3
# a is 5 and b is 4
# a is 3 and b is 4
# a is 5 and b is 1
# a is 4 and b is 1
# a is 3 and b is 1
# a is 2 and b is 1
# => [1, 2, 3, 4, 5]
# a is 2 and b is 5
# a is 5 and b is 3
# a is 2 and b is 3
# a is 5 and b is 4
# a is 3 and b is 4
# a is 5 and b is 1
# a is 4 and b is 1
# a is 3 and b is 1
# a is 2 and b is 1
# => [1, 2, 3, 4, 5]

