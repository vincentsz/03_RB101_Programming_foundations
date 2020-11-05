[1, 2, 3].any? do |num|
  num > 2
end

{ a: "ant", b: "bison", c: "dog"}.any? do |key, value|
  value.size > 4
end

[1, 2, 3].all? do |num|
  num > 2
end

{ a: "ant", b: "bear", c: "cat"}.all? do |key, value|
  value.size <= 4
end

[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end

{ a: "ant", b: "bear", c: "cat"}.each_with_index do |pair, index|
  puts "The index of #{pair} is #{index}."
end

[1, 2 , 3].each_with_object([]) do |element, collection|
  collection << element if element.odd?
end

{ a: "ant", b: "bear", c: "cat"}.each_with_object([]) do |pair, collection|
  collection << pair.last 
end

{ a: "ant", b: "bear", c: "cat"}.each_with_object({}) do |(key, value), collection|
  collection[value] = key
end

[1, 2, 3].first

{ a: "ant", b: "bear", c: "cat" }.first(2)

[1, 2, 3].partition do |num|
  num.odd?
end

odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

long, short = { a: "ant", b: "bear", c: "cat"}.partition do |key, value|
  value.size > 3
end

