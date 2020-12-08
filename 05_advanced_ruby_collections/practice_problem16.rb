=begin
1.Understand problem
Input:
Output:a string, consisting of 8-4-4--4-12 chars, of which each char is randomly slected from the hexadecimal number system (1..9, a..f)
Rules:
-Explicit:
-Implicit:
2.Examples
return_uuid => "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
3.Data structure

4.Algorithm

=end
HEX_NUMERAL_SYSTEM = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]
SEQUENCE = [8, 4, 4, 4, 12]

def sample_hex
  HEX_NUMERAL_SYSTEM.sample
end

def return_uuid
  SEQUENCE.each do|num|
    num.times{ |i| print "#{sample_hex}"} 
    print "-" if num != 12
  end
end

return_uuid

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  new_hash = {}
  hash.each do |key, value|
    new_hash[key] = value + 1 
  end
  new_hash
end


hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.map do |_, hash|
  if hash[:type] == 'fruit'
    hash[:colors].map do |color|
      color.capitalize
    end
  else
    hash[:size].upcase
  end
end

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hash|
  hash.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end


def return_uuid
  hex_values = []
  (1..9).each { |number| hex_values << number.to_s }
  ('a'..'f').each { |letter| hex_values << letter }
  
  sequence = [8, 4, 4, 4, 12]
  uuid_value = ''
  sequence.each_with_index do |value, index|
    value.times { uuid_value << hex_values.sample }
    uuid_value << '-' unless index == sequence.size - 1
  end

  uuid_value
end

return_uuid