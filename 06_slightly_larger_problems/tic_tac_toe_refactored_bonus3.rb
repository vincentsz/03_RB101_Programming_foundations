# constants--------------------------------------------------------------
INITIAL_VALUE = ' '
PLAYER_VALUE = 'X'
COMPUTER_VALUE = 'O'
WINNING_COMBOS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                 [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                 [[1, 5, 9], [3, 5, 7]]
MIDDLE_SQUARE = 5
PLAYER_STARTS = 'P'
COMPUTER_STARTS = 'C'
RANDOM_STARTS = 'R'
START_LEGEND = {
  PLAYER_STARTS => 'player',
  COMPUTER_STARTS => 'computer',
  RANDOM_STARTS => 'random'
}

# methods--------------------------------------------------------------
def initalize_score
  { player: 0, computer: 0 }
end

def prompt(text)
  puts "=> #{text}"
end

def choose_starting_player
  starting_player = ''
  prompt "Best out of five wins!"
  loop do
    prompt "Who would you like to go first?"
    prompt "Press #{PLAYER_STARTS} for #{START_LEGEND[PLAYER_STARTS]}."
    prompt "Press #{COMPUTER_STARTS} for #{START_LEGEND[COMPUTER_STARTS]}."
    prompt "Press #{RANDOM_STARTS} for #{START_LEGEND[RANDOM_STARTS]}."
    starting_player = gets.chomp.upcase

    break if valid_starter?(starting_player)
    prompt "Sorry, invalid input!"
  end

  if starting_player == RANDOM_STARTS
    starting_player = [PLAYER_STARTS, COMPUTER_STARTS].sample
  end

  starting_player
end

def valid_starter?(choice)
  [PLAYER_STARTS, COMPUTER_STARTS, RANDOM_STARTS].include?(choice)
end

def initalize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_VALUE }
  new_board
end

def clear_screen
  system("clear") || system("cls")
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def result_board(brd, plyr, cntr)
  clear_screen
  puts "#{START_LEGEND[plyr].capitalize} goes first."
  puts "Game number #{cntr}/5."
  puts "#{START_LEGEND[PLAYER_STARTS].capitalize} is #{PLAYER_VALUE}."
  puts "#{START_LEGEND[COMPUTER_STARTS].capitalize} is #{COMPUTER_VALUE}."
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
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def place_piece(brd, plyr)
  if plyr == PLAYER_STARTS
    player_choice!(brd)
  else
    computer_choice!(brd)
  end
end

def player_choice!(brd)
  player_choice = ''
  loop do
    prompt "Choose one of the following squares:"
    prompt joinor(empty_squares(brd))
    player_choice = gets.chomp

    break if valid_choice?(player_choice, brd)
    prompt "Sorry, invalid input!"
  end
  brd[player_choice.to_i] = PLAYER_VALUE
end

def valid_choice?(choice, brd)
  (choice == choice.to_i.to_s) && (empty_squares(brd).include?(choice.to_i))
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_VALUE }
end

def joinor(array, separator = ', ', last = 'or ')
  choices = ''
  array.each_with_index do |element, index|
    choices << if (index == array.size - 2) || (array.size == 1)
                 element.to_s + ' '
               elsif index == array.size - 1
                 last + element.to_s
               else
                 element.to_s + separator
               end
  end
  choices
end

def computer_choice!(brd)
  computer_choice = if immediate_move?(brd, COMPUTER_VALUE)
                      immediate_square(brd, COMPUTER_VALUE)[0]
                    elsif immediate_move?(brd, PLAYER_VALUE)
                      immediate_square(brd, PLAYER_VALUE)[0]
                    elsif middle_available?(brd)
                      MIDDLE_SQUARE
                    else
                      empty_squares(brd).sample
                    end

  brd[computer_choice] = COMPUTER_VALUE
end

def middle_available?(brd)
  empty_squares(brd).include?(MIDDLE_SQUARE)
end

def immediate_move?(brd, value)
  !!immediate_square(brd, value)
end

def immediate_square(brd, value)
  WINNING_COMBOS.each do |list|
    if (brd.values_at(*list).count(value) == 2) &&
       (brd.values_at(*list).count(INITIAL_VALUE) == 1)
      return list.select do |square|
        brd[square] == INITIAL_VALUE
      end
    end
  end
  nil
end

def alternate_player(plyr)
  if plyr == PLAYER_STARTS
    COMPUTER_STARTS
  else
    PLAYER_STARTS
  end
end

def someone_won?(brd)
  !!establish_winner(brd)
end

def establish_winner(brd)
  WINNING_COMBOS.each do |list|
    if brd.values_at(*list).all?(PLAYER_VALUE)
      return "#{START_LEGEND[PLAYER_STARTS].capitalize} wins!"
    elsif brd.values_at(*list).all?(COMPUTER_VALUE)
      return "#{START_LEGEND[COMPUTER_STARTS].capitalize} wins!"
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
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

def multiples(num)
  num == 1 ? '' : 's'
end

# rubocop:disable Layout/LineLength
def display_score(scr)
  prompt "#{START_LEGEND[PLAYER_STARTS].capitalize} has #{scr[:player]} point#{multiples(scr[:player])}."
  prompt "#{START_LEGEND[COMPUTER_STARTS].capitalize} has #{scr[:computer]} point#{multiples(scr[:computer])}."
end
# rubocop:enable Layout/LineLength

def pace_interaction
  Kernel.sleep(4)
end

def someone_won_game?(scr)
  !!establish_winner_game(scr)
end

def establish_winner_game(scr)
  if scr[:player] > scr[:computer]
    return "#{START_LEGEND[PLAYER_STARTS].capitalize} won best out of five!"
  elsif scr[:computer] > scr[:player]
    return "#{START_LEGEND[COMPUTER_STARTS].capitalize} won best out of five!"
  end
  nil
end

def play_again?
  answer = ''
  loop do
    prompt "Play again? Type Y or N"
    answer = gets.chomp.upcase
    break if ['Y', 'N', 'NO', 'YES'].include?(answer)
    prompt "Invalid input!"
  end
  answer.start_with?('Y')
end

# main program--------------------------------------------------------------
prompt "Welcome to TicTacToe!"
loop do # entire game loop
  score = initalize_score
  starting_player = choose_starting_player
  game_counter = 1
  loop do # best of five loop
    current_player = starting_player
    board = initalize_board
    loop do # 1 game loop
      result_board(board, starting_player, game_counter)
      place_piece(board, current_player)
      result_board(board, starting_player, game_counter)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end
    game_counter += 1
    keep_score(establish_winner(board), score)

    if someone_won?(board)
      prompt(establish_winner(board))
    else
      prompt "It's a tie!"
    end

    display_score(score)
    pace_interaction # pauze to read results before screen is reset
    starting_player = alternate_player(starting_player) # opposite starts
    break if game_counter >= 6
  end

  if someone_won_game?(score)
    prompt(establish_winner_game(score))
  else
    prompt "The game is a tie!"
  end

  answer = play_again
  break if answer
end

prompt "Thank you for playing! Goodbye!"
