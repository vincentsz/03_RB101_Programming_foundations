=begin
1.Understand problem
Input:a string
Output:a new string that contains the original value using a staggered capitalization scheme
Rules:stagger capitalization starts at index 0
-Explicit:
-Implicit:
2.Examples
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
3.Data structure

4.Algorithm
-Set an emty array variable characters
-Downcase string
-Split the string in individual characters, store in array.
-Iterate through array with index
-If index is even, capitalize and store to characters
-If index is uneven, store to characters
-Join characters
=end
def prompt(text)
  puts "=>#{text}"
end

def retrieve_options
  input = ''
  loop do 
    prompt("Should the new string start with uppercase(press U) or lowercase (press L)?")
    input = gets.chomp.downcase
    if input == "u"
      prompt("You chose uppercase!")
      break
    elsif input == "l"
      prompt("You chose lowercase!")
      break
    else
      write("Incorrect input!")
    end
  end
  input
end

def staggered_case(string)
    characters = []
    switch = true
    switch = !switch if retrieve_options == "l"
    string.chars.each do |char|
    if switch
      characters << char.upcase
    else
      characters << char.downcase
    end
    switch = !switch
  end
  characters.join
end

staggered_case('I Love Launch School!') 
staggered_case('ALL_CAPS') 
staggered_case('ignore 77 the 444 numbers') 

#textbook solution

def staggered_case(string)
  result =''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper != need_upper
  end
  result
end
