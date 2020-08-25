#examples

#pass by value

def change_name(name)
  name = 'bob'
end

name = 'jim'
change_name(name)
puts name

#pass by reference

def cap(str)
  str.capitalize!
end

name = "jim"
cap(name)
puts name

#pass by value

def cap(str)
  str.capitalize
end

name = "jim"
cap(name)
puts name

#pass by reference

def add_name(arr, name)
  arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names.inspect

#pass by value: re-assignment is not considered a destructive operation

def add_name(arr,name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names.inspect

#pass by reference

def add_name(arr, name)
  arr = arr << name
end

names = ['bob','kim']
add_name(names, 'jim')
puts names.inspect