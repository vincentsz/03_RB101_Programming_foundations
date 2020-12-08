VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
WIN = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['paper', 'spock'],
  'spock' => ['rock', 'scissors']
}
YES_NO = ['yes', 'no']
AMOUNT_T0_WIN = [5]

def clear_screen
  system("clear") || system("cls")
end

def prompt(message)
  puts("=> #{message}")
end

def display_welcome
  prompt("Welcome to #{VALID_CHOICES.join(', ')}! Best out of #{AMOUNT_T0_WIN[0]} wins the game!")
end

def reset_scores
  { player_score: 0, computer_score: 0 }
end

def retrieve_user_choice
  retrieved_user_choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}.")
    retrieved_user_choice = convert_user_choice(gets.chomp)
    if VALID_CHOICES.include?(retrieved_user_choice)
      break
    end
  end
  retrieved_user_choice
end

def convert_user_choice(input)
  if input == ('r') || input == VALID_CHOICES[0]
    VALID_CHOICES[0]
  elsif input == ('p') || input == VALID_CHOICES[1]
    VALID_CHOICES[1]
  elsif input == ('sc') || input == VALID_CHOICES[2]
    VALID_CHOICES[2]
  elsif input == ('l') || input == VALID_CHOICES[3]
    VALID_CHOICES[3]
  elsif input == ('sp') || input == VALID_CHOICES[4]
    VALID_CHOICES[4]
  elsif input == ('s')
    prompt("Invalid choice! Specify #{VALID_CHOICES[2]} (sc) or #{VALID_CHOICES[4]} (sp).")
  else
    prompt("Invalid choice!")
  end
end

def random_choice
  VALID_CHOICES.sample
end

def display_choices(player, computer)
  prompt("You chose: #{player}, Computer chose: #{computer}.")
end

def win?(first, second)
  WIN[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def add_score(player, computer, score)
  if win?(player, computer)
    score[:player_score] += 1
  elsif win?(computer, player)
    score[:computer_score] += 1
  else
    score[:player_score] += 1
    score[:computer_score] += 1
  end
end

def display_score(score)
  player = score[:player_score]
  computer = score[:computer_score]
  prompt("You have #{player} point#{player == 1 ? '' : 's'}!")
  prompt("The computer has #{computer} point#{computer == 1 ? '' : 's'}!")
end

def display_winner(score)
  if score[:player_score] == AMOUNT_T0_WIN[0] && score[:computer_score] == AMOUNT_T0_WIN[0]
    prompt("The game is a tie!")
  elsif score[:player_score] == AMOUNT_T0_WIN[0]
    prompt("You won the game!")
  elsif score[:computer_score] == AMOUNT_T0_WIN[0]
    prompt("The computer won the game!")
  end
end

def someone_won?(score)
  score[:player_score] == AMOUNT_T0_WIN[0] || score[:computer_score] == AMOUNT_T0_WIN[0]
end

def retrieve_play_again
  play_again = ''
  loop do
    prompt("Do you want to play again?")
    prompt("(Y to continue playing, N to stop playing)")
    play_again = convert_play_again(gets.chomp)
    if YES_NO.include?(play_again)
      break
    end
  end
  play_again
end

def convert_play_again(input)
  if input.downcase == ('y') || input.downcase == YES_NO[0]
    YES_NO[0]
  elsif input.downcase == ('n') || input.downcase == YES_NO[1]
    YES_NO[1]
  else
    prompt("Invalid choice! (Y to continue playing, N to stop playing)")
  end
end

def display_goodbye
  prompt("Thank you for playing!")
end

loop do
  clear_screen
  display_welcome
  scores = reset_scores
  user_choice = ''
  computer_choice = ''
  loop do
    user_choice = retrieve_user_choice
    computer_choice = random_choice
    display_choices(user_choice, computer_choice)
    display_results(user_choice, computer_choice)
    add_score(user_choice, computer_choice, scores)
    display_score(scores)
    break if someone_won?(scores)
  end
  display_winner(scores)
  break unless retrieve_play_again == YES_NO[0]
end
display_goodbye
