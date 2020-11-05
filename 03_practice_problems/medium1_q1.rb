=begin
1.Understand problem
Output: a given text, printed ten times, each on a new line, each with a space added in front.
2.Examples

3.Data structure

4.Algorithm
Start counter at 0. Puts counter times space + given text. Add 1. Loop until counter reaches 10
=end

text = "The Flintstones rock"
(1..10).each {|n| puts (" " * n)  + "#{text}"}