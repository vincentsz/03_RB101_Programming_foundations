=begin

1.Understand the problem
Input: length and width of room in meters. Output: area of room in square meters and feet
2.Test cases
4m x 3m == 12m (129,167sqft)
3.Data structure
4.Algorithm
Ask for length in m. convert to float, convert store in variable l. Ask for width in m, convert to float,  store in variable w. Multiply variables with each other, store in variable sqm. Multiply variable sqm by 10,764, stor in varibale sqft

=end

SQM_TO_SQFT = 10.7639
def room_size
  puts "Please give the room's length in meter"
  length = gets.chomp.to_f
  puts "Please give the room's width in meter"
  width = gets.chomp.to_f
  sqm = (length * width).round(2)
  sqft = (sqm * SQM_TO_SQFT).round(2)
  puts "The room is #{sqm}sqm (#{sqft}sqft)."
end

room_size


SQFT_TO_SQIN = 144
SQFT_TO_SQM = 1/10.7639
def room_size_sqft
  puts "Please give the room's length in feet"
  length = gets.chomp.to_f
  puts "Please give the room's width in feet"
  width = gets.chomp.to_f
  sqft = (length * width).round(2)
  sqin = (sqft * SQFT_TO_SQIN).round(2)
  sqm = (sqft * SQFT_TO_SQM ).round(2)
  puts "The room is #{sqft}sqft (#{sqin}sqin, #{sqm}sqm)."
end

room_size_sqft