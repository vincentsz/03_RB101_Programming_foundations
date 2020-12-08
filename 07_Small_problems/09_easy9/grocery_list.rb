def buy_fruit(array)
  list = []
  array.each do |fruit|
    fruit[1].times {list << fruit[0]} 
  end
  list
end

buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])

def buy_fruit(array)
  array.map {|fruit| [fruit[0]]*fruit[1]}.flatten
end
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])

def buy_fruit(list)
  list.map { |fruit, quantity| fruit * quantity }
end

buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])

original = ["apple"]
multiplied = original * 3 
original
multiplied
original.object_id
multiplied.object_id
original[0].object_id
multiplied[0].object_id
multiplied[1].object_id

test = ["apples"]*3