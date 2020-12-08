# require 'pry'
# require 'pry-byebug'

INITIAL_VALUE = ' '
PLAYER_VALUE = 'X'
COMPUTER_VALUE = 'O'
WINNING_COMBOS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                 [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                 [[1, 5, 9], [3, 5, 7]]
MIDDLE_SQUARE = 5


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

def joinor(array, separator = ', ', last = 'or' )
  choices = ''
  array.each_with_index do |element, index|
    if index <= 1
      choices << element.to_s
    elsif index < array.size - 1
      choices << element.to_s + "#{separator}"
    else
      choices << "#{last} " + element.to_s 
    end
  end
  choices
end

def player_choice!(brd)
  loop do
    prompt "Choose one of the following squares:"
    prompt joinor(empty_squares(brd))
    player_choice = gets.chomp.to_i
    if empty_squares(brd).include?(player_choice)
      brd[player_choice] = PLAYER_VALUE
      break
    else
      puts "Sorry, invalid input"
    end
  end
end

def vulnerable_square(brd)
  # binding.pry
  WINNING_COMBOS.each do |list|
    if (brd.values_at(*list).count(PLAYER_VALUE) == 2) && (brd.values_at(*list).count(INITIAL_VALUE) == 1)
      return list.select do |square|
        brd[square] == INITIAL_VALUE
      end
    end
  end
  nil
end

def immediate_treath?(brd)
  !!vulnerable_square(brd)
end

def winning_square(brd)
  WINNING_COMBOS.each do |list|
    if (brd.values_at(*list).count(COMPUTER_VALUE) == 2) && (brd.values_at(*list).count(INITIAL_VALUE) == 1)
      return list.select do |square|
        brd[square] == INITIAL_VALUE
      end
    end
  end
  nil
end

def immediate_win?(brd)
  !!winning_square(brd)
end

def middle_available?(brd)
  empty_squares(brd).include?(MIDDLE_SQUARE)
end

def computer_choice!(brd)
  computer_choice = ''
  if immediate_win?(brd)
    computer_choice = winning_square(brd)[0]
  elsif immediate_treath?(brd)
    computer_choice = vulnerable_square(brd)[0]
  elsif middle_available?(brd)
    computer_choice = MIDDLE_SQUARE
  else
    computer_choice = empty_squares(brd).sample
  end

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

def initalize_score
  { player: 0, computer: 0 }
end

def keep_score(winner, score)
  if winner == "Player wins!"
    score[:player] += 1
  elsif winner == "Computer wins!"
    score[:computer] += 1
  else
    score[:player] += 1
    score[:computer] += 1
  end
  score
end

def establish_winner_game(score)
  if score[:player] == 5
    return "Player won game!"
  elsif score[:computer] == 5
    return "Computer won game!"
  end
  nil
end

def someone_won_game? (establish_winner_game)
  !!establish_winner_game
end

loop do
  score = initalize_score
  loop do #best of five loop
    board = initalize_board
    loop do
      player_choice!(board)
      result_board(board)
      break if someone_won?(board) || board_full?(board)
      computer_choice!(board)
      result_board(board)
      break if someone_won?(board) || board_full?(board)
    end

    if someone_won?(board)
      prompt(establish_winner(board))
    else
      prompt "It's a tie!"
    end
    
    keep_score(establish_winner(board), score)
    prompt "Player has #{score[:player]} point#{score[:player] == 1 ? '' :'s'}. Computer has #{score[:computer]} point#{score[:computer] == 1 ? '' :'s'}."
   
    break if someone_won_game?(establish_winner_game(score))
  end

  if someone_won_game?(establish_winner_game(score))
    prompt (establish_winner_game(score))
  else
    prompt "The game is a tie!"
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
