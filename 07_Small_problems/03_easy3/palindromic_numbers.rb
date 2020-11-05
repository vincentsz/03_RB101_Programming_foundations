=begin
1.Understand problem

2.Examples

3.Data structure

4.Algorithm

=end

def palindromic_number? (n)
  n == n.to_s.reverse.to_i
end

palindromic_number?(34543) 
palindromic_number?(123210) 
palindromic_number?(22) 
palindromic_number?(5) 