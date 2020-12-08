=begin
1.Understand problem
Input:string
Output:string in which each chracter is doubled
Rules:
-Explicit:
-Implicit:
2.Examples

3.Data structure

4.Algorithm

=end
def repeater(string)
  doubled_string = ''
  string.chars.each do |char|
    doubled_string << (char * 2)
  end
  doubled_string
end

repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''