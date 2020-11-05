=begin

1.Understand problem
Input: name or name!
Output: Hello name. or HELLO NAME. WHY ARE WE SCREAMING?
2.Examples
name(Bob) => Hello Bob.
name(Bob!) => HELLO BOB. WHY ARE WE SCREAMING?
3.Data structure
String to array
4.Algorithm
Retrieve name. Save letters to array. If last value of array is not !, return Hello name. If last value of array is !, return HELLO NAME. WHY ARE WE SCREAMING?

=end

puts "Please give in your name:"
name = gets.chomp
letters = name.chars

if letters.last == "!"
  puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end


