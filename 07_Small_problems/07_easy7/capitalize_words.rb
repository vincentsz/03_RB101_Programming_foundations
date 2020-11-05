=begin
1.Understand problem
Input: a single string argument, containing one or more words
Output: 
-a new string that contains the original value of the argument with the first character of every word capitalized
-and all other letters lowercase.
Rules:
-Explicit:
-Implicit: a "quoted" word should not be capitalized
2.Examples
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
3.Data structure
array
4.Algorithm
-Down case input string
-Split string into words and save individual word to array.
-iterate through array and capitalize each word individually
-join array, leaving a space between each word

=end

def word_cap(words)
  words.split.map (&:capitalize).join(' ')
end

word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'