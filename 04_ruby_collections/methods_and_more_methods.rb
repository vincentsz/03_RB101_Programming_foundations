[1, 2, 3].select do |num|
  num > 5
  puts 'hi'
end

['ant', 'bat', 'caterpillar'].count do |str|
  str.length 
end

{ a: 'ant', b: 'bear' }.map do |key, value|
  value
end

if "abc".size > 3
  
end