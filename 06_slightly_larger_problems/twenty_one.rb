# Constants------------------------
SUITS = ["hearts", "diamonds", "clubs", "spades"]

VALUES_NUMERIC = {
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5" => 5,
  "6" => 6,
  "7" => 7,
  "8" => 8,
  "9" => 9,
  "10" => 10,
  "jack" => 10,
  "queen" => 10,
  "king" => 10,
  "ace" => [1, 11]
}
VOWELS = ["a", "e", "i", "o", "u"]
VALUES_N_NUMERIC = {
  "2" => "two",
  "3" => "three",
  "4" => "four",
  "5" => "five",
  "6" => "six",
  "7" => "seven",
  "8" => "eight",
  "9" => "nine",
  "10" => "ten",
  "jack" => "jack",
  "queen" => "queen",
  "king" => "king",
  "ace" => "ace"
}

VALID_CHOICES = ["h", "hit", "s", "stay"]

BUST = 22

VALID_ANSWERS = ['y', 'yes', 'n', 'no']

# Methods--------------------------
# rubocop:disable Layout/LineLength
def welcome_player
  prompt "Welcome to 21!"
  prompt "Try to get as close to 21 as possible, without going over. \n If you go over 21, it's a 'bust' and you lose!"
end
# rubocop:enable Layout/LineLength

def prompt(text)
  puts "=> #{text}"
end

def clear_screen
  system("clear") || system("cls")
end

def initalize_deck
  deck = {}
  SUITS.each do |suit|
    VALUES_NUMERIC.each do |value, num|
      deck[[value, suit]] = num
    end
  end
  deck
end

def initialize_hand
  []
end

def dealing_initial_cards(plyr, dlr, crnt)
  deal_card!(plyr, crnt)
  deal_card!(dlr, crnt)
  deal_card!(plyr, crnt)
  deal_card!(dlr, crnt)
end

def deal_card!(hand, crnt)
  selection = crnt.sample
  hand << selection
  update_current_deck!(crnt, selection)
end

def update_current_deck!(crnt, slctn)
  crnt.delete(slctn)
end

def display_initial_hands(plyr, dlr)
  prompt "Dealer has #{display_card(dlr[0])} and an unknown card."
  prompt "You have #{joinand(plyr)}."
end

def joinand(hand, separator = ', ', last = 'and ')
  result = ''
  hand.each_with_index do |card, index|
    result << if index == hand.size - 2
                display_card(card) + ' '
              elsif index == hand.size - 1
                last + display_card(card)
              else
                display_card(card) + separator
              end
  end
  result
end

def display_card(card)
  display_a_or_an(card[0]) + card[0] + " of " + card[1]
end

def display_a_or_an(value)
  a_or_an?(value) ? "an " : "a "
end

def a_or_an?(vlu)
  VOWELS.include?(VALUES_N_NUMERIC[vlu][0])
end

def retrieve_player_choice
  player_choice = ''
  loop do
    pace_interaction
    prompt "Do you want to hit or stay?"
    prompt "Press 'h' to hit and 's' to stay."
    player_choice = gets.chomp
    break if VALID_CHOICES.include?(player_choice.downcase)
    prompt "Sorry, invalid input!"
  end
  player_choice[0].downcase
end

def player_turn(choice, plyr, dlr, crnt)
  loop do
    case choice
    when "h"
      prompt "Player hits!"
      deal_card!(plyr, crnt)
      display_initial_hands(plyr, dlr)
      break unless under_22?(plyr)
      choice = retrieve_player_choice
    when "s"
      break
    end
  end
  choice
end

def under_22?(plyr)
  calculate_score(plyr) < BUST
end

def calculate_score(hand)
  non_aces = []
  aces = []
  hand.each do |card|
    if VALUES_NUMERIC[card[0]].is_a?(Integer)
      non_aces << VALUES_NUMERIC[card[0]]
    else
      aces << VALUES_NUMERIC[card[0]]
    end
  end

  total_non_aces = sum_non_aces(non_aces)

  if aces.empty?
    total_non_aces
  else
    sums_aces(aces, total_non_aces)
  end
end

def sum_non_aces(non_aces)
  non_aces.sum
end

def sums_aces(aces, total_non_aces)
  aces_combinations = VALUES_NUMERIC["ace"].repeated_combination(aces.size).to_a
  sums_aces = aces_combinations.map { |array| array.sum + total_non_aces }
  if sums_aces.any? { |num| num < BUST }
    sums_aces.select { |num| num < BUST }.max
  else
    sums_aces.min
  end
end

def display_player_move(plyr, dlr)
  if under_22?(plyr)
    prompt "Player stays!"
    display_dealer_hands(dlr)
  else
    pace_interaction
    prompt "You bust!"
    prompt "You have #{calculate_score(plyr)}."
    prompt "Dealer had #{joinand(dlr)}."
    prompt "Dealer wins!"
  end
end

def display_score(plyr, dlr)
  pace_interaction
  prompt "You have #{calculate_score(plyr)}!"
  prompt "Dealer has #{calculate_score(dlr)}!"
end

def computer_turn(dlr, crnt)
  loop do
    break if calculate_score(dlr) >= 17
    prompt "Dealer hits!"
    deal_card!(dlr, crnt)
    display_dealer_hands(dlr)
  end
end

def display_dealer_hands(dlr)
  pace_interaction
  prompt "Dealer has #{joinand(dlr)}."
end

def display_dealer_move(dlr)
  pace_interaction
  if under_22?(dlr)
    prompt "Dealer stays!"
  else
    prompt "Dealer bust!"
  end
end

def pace_interaction
  Kernel.sleep(4)
end

def display_winner(plyr, dlr)
  if (calculate_score(plyr) > calculate_score(dlr) && under_22?(plyr)) ||
     !under_22?(dlr)
    prompt "You win!"
  elsif calculate_score(plyr) == calculate_score(dlr)
    prompt "It's a tie!"
  else
    prompt "Dealer wins!"
  end
end

def play_again?
  answer = ''
  loop do
    prompt "Do you want to play again?"
    prompt "Press 'y' for yes and 'n' for no"
    answer = gets.chomp.downcase
    break if VALID_ANSWERS.include?(answer)
    prompt "Sorry, invalid input!"
  end
  answer.start_with?('y')
end

# Main program----------------------
welcome_player
loop do
  pace_interaction
  initial_deck = initalize_deck
  current_deck = initial_deck.keys
  player_hand = initialize_hand
  dealer_hand = initialize_hand
  dealing_initial_cards(player_hand, dealer_hand, current_deck)
  display_initial_hands(player_hand, dealer_hand)
  player_choice = retrieve_player_choice
  player_turn(player_choice, player_hand, dealer_hand, current_deck)
  display_player_move(player_hand, dealer_hand)

  if under_22?(player_hand)
    computer_turn(player_hand, dealer_hand, current_deck)
    display_dealer_move(dealer_hand)
    display_score(player_hand, dealer_hand)
    display_winner(player_hand, dealer_hand)
  end
  
  pace_interaction
  answer = play_again?
  break unless answer
  clear_screen
end

prompt "Thank you for playing 21! Goodbye!"
