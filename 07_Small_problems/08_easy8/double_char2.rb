CONSONANTS = ''
CONSONANTS << ("a".."z").to_a.join.gsub(/[aeiou]/,'')
CONSONANTS << ("A".."Z").to_a.join.gsub(/[AEIOU]/,'')

def double_consonants(string)
  doubled_consonants = ''
  string.each_char do |char|
    if CONSONANTS.include? char
    doubled_consonants << (char * 2)
    else
      doubled_consonants << char
    end
  end
  doubled_consonants
end

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

#textbook solution
CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end