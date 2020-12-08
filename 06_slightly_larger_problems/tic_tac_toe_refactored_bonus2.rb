require 'rubocop'
# constants--------------------------------------------------------------
INITIAL_VALUE = ' '
PLAYER_VALUE = 'X'
COMPUTER_VALUE = 'O'
WINNING_COMBOS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                 [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                 [[1, 5, 9], [3, 5, 7]]
MIDDLE_SQUARE = 5
STARTING_PLAYER = { 'P' => 'player', 'C' => 'Computer', 'R' => 'random' }

# methods--------------------------------------------------------------
def initalize_score
  { player: 0, computer: 0 }
end

def prompt(text)
  puts "=> #{text}"
end

# rubocop:disable Metrics/MethodLength
def choose_starting_player
  starting_player = ''
  loop do
    prompt "Who starts the game?"
    prompt "Press 'P' for #{STARTING_PLAYER['P']}."
    prompt "Press 'C' for #{STARTING_PLAYER['C']}."
    prompt "Press 'R' for #{STARTING_PLAYER['R']}."
    starting_player = gets.chomp.upcase[0]
    case starting_player
    when 'P'
      break
    when 'C'
      break
    when 'R'
      break
    else
      prompt "Invalid input!"
    end
  end

  if starting_player == 'R'
    starting_player = ['P', 'C'].sample
  end

  STARTING_PLAYER[starting_player]
end
# rubocop:enable Metrics/MethodLength

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
  puts "Game number #{cntr}/5."
  puts "#{plyr.capitalize} started."
  puts "Player is #{PLAYER_VALUE}, computer is #{COMPUTER_VALUE}."
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

def place_piece!(brd, plyr)
  if plyr == STARTING_PLAYER['P']
    player_choice!(brd)
  else
    computer_choice!(brd)
  end
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

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_VALUE }
end

def joinor(array, separator = ', ', last = 'or')
  choices = ''
  array.each_with_index do |element, index|
    if array.size == 1
      choices << element.to_s
    elsif index < array.size - 1
      choices << element.to_s + separator
    else
      choices << last + element.to_s
    end
  end
  choices
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

def middle_available?(brd)
  empty_squares(brd).include?(MIDDLE_SQUARE)
end

def immediate_win?(brd)
  !!winning_square(brd)
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

def immediate_treath?(brd)
  !!vulnerable_square(brd)
end

def vulnerable_square(brd)
  WINNING_COMBOS.each do |list|
    if (brd.values_at(*list).count(PLAYER_VALUE) == 2) && (brd.values_at(*list).count(INITIAL_VALUE) == 1)
      return list.select do |square|
        brd[square] == INITIAL_VALUE
      end
    end
  end
  nil
end

def alternate_player(plyr)
  if plyr == STARTING_PLAYER['P']
    STARTING_PLAYER['C']
  else
    STARTING_PLAYER['P']
  end
end

def someone_won?(brd)
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

def display_score(scr)
  prompt "Player has #{scr[:player]} point#{scr[:player] == 1 ? '' : 's'}."
  prompt "Computer has #{scr[:computer]} point#{scr[:computer] == 1 ? '' : 's'}."
end

def pace_interaction
  Kernel.sleep(2)
end

def someone_won_game?(scr)
  !!establish_winner_game(scr)
end

def establish_winner_game(scr)
  if scr[:player] > scr[:computer]
    return "Player won best out of five!"
  elsif scr[:computer] > scr[:player]
    return "Computer won best out of five!"
  end
  nil
end

def play_again?
  answer = ''
  loop do
    prompt "Play again? Type Y or N"
    answer = gets.chomp[0].upcase
    break if answer[0].upcase == "Y" || answer[0].upcase == "N"
    prompt "Invalid input!"
  end
  answer
end

# main program--------------------------------------------------------------
loop do # entire game loop
  score = initalize_score
  starting_player = choose_starting_player
  game_counter = 1
  loop do # best of five loop
    current_player = starting_player
    board = initalize_board
    loop do # 1 game loop
      result_board(board, starting_player, game_counter)
      place_piece!(board, current_player)
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
    starting_player = alternate_player(starting_player) # game starts with the opposite player
    break if game_counter > 5
  end

  if someone_won_game?(score)
    prompt(establish_winner_game(score))
  else
    prompt "The game is a tie!"
  end

  answer = play_again?
  break if answer == "N"
end

prompt "Goodbye!"
