=begin
1.Understand problem

2.Examples

3.Data structure

4.Algorithm

=end

def is_an_ip_number?(number)
  number = number.to_i
  (0..255).include?(number)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4
    
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
    
end


dot_separated_ip_address?("11.11.11.11")
dot_separated_ip_address?("11.11.11")
dot_separated_ip_address?("11.11.11.11.11")
dot_separated_ip_address?("11.11.11.280")