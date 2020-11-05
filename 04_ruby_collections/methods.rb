[1, 2, 3].each do |n|
  puts n
end

hash = { a: 2, b: 2, c: 3}

hash.each do |k,v|
  puts "The key is #{k} and the value is #{v}"
end

def a_method
  [1, 2, 3]. each do |n|
    puts n
  end
  puts 'hi'
end

[1, 2, 3].select do |n|
  n.odd?
end