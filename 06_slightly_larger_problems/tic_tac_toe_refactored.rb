# require 'pry'
# require 'pry-byebug'

INITIAL_VALUE = ' '
PLAYER_VALUE = 'X'
COMPUTER_VALUE = 'O'
WINNING_COMBOS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                 [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                 [[1, 5, 9], [3, 5, 7]]

def prompt(text)
  puts "=> #{text}"
end

# rubocop:disable Metrics/AbcSize
def result_board(brd)
  system "clear"
  puts "You are #{PLAYER_VALUE}, computer is #{COMPUTER_VALUE}."
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initalize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_VALUE }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_VALUE }
end

def player_choice!(brd)
  loop do
    prompt "Choose one of the following squares:"
    prompt(empty_squares(brd).join(','))
    player_choice = gets.chomp.to_i
    if empty_squares(brd).include?(player_choice)
      brd[player_choice] = PLAYER_VALUE
      break
    else
      puts "Sorry, invalid input"
    end
  end
end

def computer_choice!(brd)
  computer_choice = empty_squares(brd).sample
  brd[computer_choice] = COMPUTER_VALUE
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  # binding.pry
  !!establish_winner(brd)
end

def establish_winner(brd)
  WINNING_COMBOS.each do |list|
    if brd.values_at(*list).all?(PLAYER_VALUE)
      return "Player wins!"
    elsif brd.values_at(*list).all?(COMPUTER_VALUE)
      return "Computer wins!"
    end
  end
  nil
end

loop do
  board = initalize_board
  loop do
    player_choice!(board)
    break if someone_won?(board) || board_full?(board)
    computer_choice!(board)
    break if someone_won?(board) || board_full?(board)
    result_board(board)
  end

  if someone_won?(board)
    prompt(establish_winner(board))
  else
    prompt "It's a tie!"
  end

  answer = ''
  loop do
    prompt "Play again? Type Y or N"
    answer = gets.chomp
    break if answer[0].upcase == "Y" || answer[0].upcase == "N"
    prompt "Invalid input!"
  end

  break if answer[0].upcase == "N"
end

prompt "Goodbye!"
