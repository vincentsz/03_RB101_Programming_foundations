statement = "The Flintstones Rock"
character_count = Hash.new(0)

statement.delete(' ').each_char do |char|
  character_count[char] += 1
end

character_count

#textbook

statement = "The Flintstones Rock"
collection = {}
alphabet = ('a'..'z').to_a + ('A'..'Z').to_a

alphabet.each do |letter|
  current_count = statement.scan(letter).count
collection[letter] = current_count if current_count > 0
end

collection