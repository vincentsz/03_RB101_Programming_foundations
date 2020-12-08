require 'pry'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                       [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                       [[1, 5, 9], [3, 5, 7]]

def prompt(text)
  puts "=> #{text}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER}, computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_square(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{empty_square(brd).join(',')}):"
    square = gets.chomp.to_i
    break if empty_square(brd).include?(square)
    prompt "Sorry, invalid input!"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_square(brd).sample
  brd[square] = COMPUTER_MARKER
end

def detect_winner(brd)
  WINNING_COMBINATIONS.each do |list|
  # if brd[list[0]] == PLAYER_MARKER &&
  #    brd[list[1]]  == PLAYER_MARKER &&
  #    brd[list[2]]  == PLAYER_MARKER
  #   return "Player won!"
  # elsif brd[list[0]] == COMPUTER_MARKER &&
  #       brd[list[1]] == COMPUTER_MARKER &&
  #       brd[list[2]] == COMPUTER_MARKER
  #   return "Computer won!"
  # end
  end
  nil
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def board_full?(brd)
  empty_square(brd).empty?
end

board = initialize_board

loop do
  display_board(board)
  player_places_piece!(board)
  break if someone_won?(board) || board_full?(board)
  computer_places_piece!(board)
  break if someone_won?(board) || board_full?(board)
end

display_board(board)

if someone_won?(board)
  prompt "#{detect_winner(board)}"
else
  prompt "It's a tie!"
end
