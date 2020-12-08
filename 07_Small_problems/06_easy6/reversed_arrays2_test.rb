
#require 'pry'
#require 'pry-byebug'
def reverse(array)
  #binding.pry

  
  array.each_with_object([]) do |element, collection|
    
    collection.unshift(element)
    
    
  end
end

reverse([1,2,3,4])

def reverse(array)
  array.inject([]) do |collection, element|
    collection.unshift(element)
    
  end
end

reverse([1,2,3,4])