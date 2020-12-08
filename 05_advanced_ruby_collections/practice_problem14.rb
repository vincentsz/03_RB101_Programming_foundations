=begin
1.Understand problem
Input:a hash, of which the key is a string, the value another hash
Output:an array containg collors of the fruits and sizes of vegetables. sizes uppercase, colors capitalized
Rules:
-Explicit:
-Implicit:
2.Examples

3.Data structure

4.Algorithm

=end

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.map do |_, sub_hash|
  if sub_hash[:type] == 'fruit'
    sub_hash[:colors].map { |color| color.capitalize}
  else 
    sub_hash[:size].upcase
  end
end
