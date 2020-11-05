def bill_tip
  puts "What is the amount of the bill?"
  bill = gets.chomp.to_f
  puts "What is the percentage of the tip?"
  tip_percentage = gets.chomp.to_f
  tip = bill * (tip_percentage/100)
  total = bill + tip
  puts "The tip is $#{sprintf("%.2f", tip)}, the total is $#{sprintf("%.2f", total)}."
end

bill_tip

