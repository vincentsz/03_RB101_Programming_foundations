=begin
1.Understand problem
Input: An array of integers between 0 and 19
Output: An array of those integers, sorted alphabatically based on theEnglish word for each number
2.Examples
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
3.Data structure
arrays, hash
4.Algorithm
Create an array  words of 0 to 19 = key_array
Iterate through input_array, storing each integer that matches the index of key_array as the corresponding word in a new array. 
Sort the new array. 
Iterate over sorted array, replacing each word with corresponding index of key_array
Return new_array

=end

def alphabetic_number_sort(input_array)
  key_array = "zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen".split(', ')
  
  array_words = input_array.map do |i|
    i = key_array[i]
  end

  array_words.sort.map do |w|
    w = key_array.index(w)
  end
end

alphabetic_number_sort((0..19).to_a) 

#textbook solution
NUMBER_WORDS = [
  "zero", "one", "two", "three", "four", 
  "five", "six", "seven", "eight", "nine", 
  "ten", "eleven", "twelve", "thirteen", 
  "fourteen", "fifteen", "sixteen", "seventeen", 
  "eighteen", "nineteen"
]

def alphabetic_number_sort(input_array)
  input_array.sort_by {|n| NUMBER_WORDS[n]}
end

alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

#further exploration

def alphabetic_number_sort(input_array)
  input_array.sort {|n1, n2| NUMBER_WORDS[n1] <=> NUMBER_WORDS[n2]}
end

alphabetic_number_sort((0..19).to_a)