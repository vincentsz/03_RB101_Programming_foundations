def prompt(words)
  puts "=> #{words}"
end

def madlibs
  prompt ("Enter a noun")
  noun = gets.chomp
  prompt ("Enter a verb")
  verb = gets.chomp
  prompt ("Enter an adjective")
  adjective = gets.chomp
  prompt ("Enter an adverb")
  adverb = gets.chomp

  sentence1 = "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
  sentence2 = "The #{adjective} #{noun} #{verb}s #{adverb} under the narrow bridge."
  sentence3 = "The #{noun} #{adverb} #{verb}s in #{adjective} Tom's boat."

  prompt [sentence1, sentence2, sentence3].sample
end

madlibs