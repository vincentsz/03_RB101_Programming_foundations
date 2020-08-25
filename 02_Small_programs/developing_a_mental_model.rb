def increment(a)
  a = a + 1
end

b = 3
puts increment(b)
puts b

def append(s)
  s << '*'
end

t = 'abc'
puts append(t)
puts t

def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
puts s
puts t
s.object_id
t.object_id

def fix(value)
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)

puts s
puts t

def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end
s = 'hello'
t = fix(s)

puts s
puts t


def plus(x, y)
  x = x + y
end

a = '3'
b = plus(a,'2')
puts a
puts b 
