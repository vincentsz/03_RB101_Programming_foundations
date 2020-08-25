VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
WIN = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'spock' => ['rock', 'scissors'],
  'lizard' => ['paper', 'spock']
}

def prompt(message)
  Kernel.puts("=> #{message}")
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

prompt("Welcome to #{VALID_CHOICES.join(', ')}! Best out of 5 wins the game!")
loop do # main loop
  scores = { player_score: 0, computer_score: 0 }
  loop do
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}.")
      choice = Kernel.gets().chomp()

      if choice.start_with?('r')
        choice = 'rock'
      elsif choice.start_with?('p')
        choice = 'paper'
      elsif choice.start_with?('l')
        choice = 'lizard'
      elsif choice.start_with?('sc')
        choice = 'scissors'
      elsif choice.start_with?('sp')
        choice = 'spock'
      end

      if VALID_CHOICES.include?(choice)
        break
      elsif choice.start_with?('s')
        prompt("Invalid choice! Specify scissors (sc) or spock (sp).")
      else
        prompt("Invalid choice!")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_results(choice, computer_choice)
    add_score(choice, computer_choice, scores)

    prompt("You have #{scores[:player_score]} points, the computer has #{scores[:computer_score]} points.")

    if scores[:player_score] == 5 && scores[:computer_score] == 5
      prompt("It's a tie")
    elsif scores[:player_score] == 5
      prompt("You won the game!")
    elsif scores[:computer_score] == 5
      prompt("The computer won the game!")
    end

    if scores[:player_score] == 5 || scores[:computer_score] == 5
      break
    end
  end
  prompt("Do you want to play again? (Y to continue playing)")
  play_again = gets.chomp
  break unless play_again.downcase.start_with?('y')
end
