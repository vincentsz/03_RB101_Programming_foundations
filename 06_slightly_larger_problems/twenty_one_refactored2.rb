# Constants------------------------
SUITS = [
  { suit: "hearts" },
  { suit: "diamonds" },
  { suit: "clubs" },
  { suit: "spades" }
]

VALUES = [
  { value: "2", points: 2, alphabetical: "two" },
  { value: "3", points: 3, alphabetical: "three" },
  { value: "4", points: 4, alphabetical: "four" },
  { value: "5", points: 5, alphabetical: "five" },
  { value: "6", points: 6, alphabetical: "six" },
  { value: "7", points: 7, alphabetical: "seven" },
  { value: "8", points: 8, alphabetical: "eight" },
  { value: "9", points: 9, alphabetical: "nine" },
  { value: "10", points: 10, alphabetical: "ten" },
  { value: "jack", points: 10, alphabetical: "jack" },
  { value: "queen", points: 10, alphabetical: "queen" },
  { value: "king", points: 10, alphabetical: "king" },
  { value: "ace", points: [1, 11], alphabetical: "ace" }
]

VOWELS = ["a", "e", "i", "o", "u"]

VALID_CHOICES = ["h", "hit", "s", "stay"]

BUST = 22

DEALER_STAY = 17

VALID_ANSWERS = ['y', 'yes', 'n', 'no']

# Methods--------------------------
# rubocop:disable Layout/LineLength
def welcome_player
  prompt "Welcome to 21!"
  prompt "Try to get as close to 21 as possible, without going over. \n If you go over 21, it's a 'bust' and you lose!"
  prompt "Best of five wins the game!"
end
# rubocop:enable Layout/LineLength

def prompt(text)
  puts "=> #{text}"
end

def clear_screen
  system("clear") || system("cls")
end

def initialize_total_score
  { player: 0, dealer: 0 }
end

def display_round(cntr)
  prompt "Game #{cntr} out of 5:"
end

def initalize_deck
  deck = []
  SUITS.each do |suit|
    VALUES.each do |value|
      deck << suit.merge(value)
    end
  end
  deck
end

def initialize_hand
  []
end

def dealing_initial_cards(plyr, dlr, crnt)
  2.times do
    deal_card!(plyr, crnt)
    deal_card!(dlr, crnt)
  end
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
  pace_interaction
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
  display_a_or_an(card[:alphabetical]) + card[:value] + " of " + card[:suit]
end

def display_a_or_an(value)
  a_or_an?(value) ? "an " : "a "
end

def a_or_an?(vlu)
  VOWELS.include?([vlu][0])
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

# rubocop:disable Metrics/MethodLength
def player_turn(choice, plyr, crnt)
  player_score = ''
  loop do
    case choice
    when "h"
      prompt "Player hits!"
      deal_card!(plyr, crnt)
      display_player_hands(plyr)
      player_score = calculate_score(plyr)
      break unless under_22?(player_score)
      choice = retrieve_player_choice
    when "s"
      player_score = calculate_score(plyr)
      break
    end
  end
  player_score
end
# rubocop:enable Metrics/MethodLength

def display_player_hands(plyr)
  pace_interaction
  prompt "Player has #{joinand(plyr)}."
end

def under_22?(scr)
  scr < BUST
end

def calculate_score(hand)
  non_aces = []
  aces = []
  hand.each do |card|
    if card[:points].is_a?(Integer)
      non_aces << card[:points]
    else
      aces << card[:points]
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
  aces_combinations = aces[0].repeated_combination(aces.size).to_a
  sums_aces = aces_combinations.map { |array| array.sum + total_non_aces }
  if sums_aces.any? { |num| num < BUST }
    sums_aces.select { |num| num < BUST }.max
  else
    sums_aces.min
  end
end

def display_player_move(plyr_scr, dlr)
  if under_22?(plyr_scr)
    prompt "Player stays!"
  else
    pace_interaction
    prompt "You have #{plyr_scr}."
    prompt "You bust!"
    prompt "Dealer had #{joinand(dlr)}."
  end
end

def display_score(plyr_scr, dlr_scr)
  pace_interaction
  prompt "You have #{plyr_scr}!"
  prompt "Dealer has #{dlr_scr}!"
end

def dealer_turn(dlr, crnt)
  display_dealer_hands(dlr)
  dealer_score = ''
  loop do
    dealer_score = calculate_score(dlr)
    break if dealer_score >= DEALER_STAY
    prompt "Dealer hits!"
    deal_card!(dlr, crnt)
    display_dealer_hands(dlr)
  end
  dealer_score
end

def display_dealer_hands(dlr)
  pace_interaction
  prompt "Dealer has #{joinand(dlr)}."
end

def display_dealer_move(dlr_scr)
  pace_interaction
  if under_22?(dlr_scr)
    prompt "Dealer stays!"
  else
    prompt "Dealer has #{dlr_scr}."
    prompt "Dealer busts!"
  end
end

def pace_interaction
  Kernel.sleep(3)
end

def display_winner(plyr_scr, dlr_scr)
  if dlr_scr.nil? ||
     (plyr_scr < dlr_scr && under_22?(dlr_scr)) ||
     !under_22?(plyr_scr)
    "Dealer wins!"
  elsif plyr_scr == dlr_scr
    "It's a tie!"
  else
    "You win!"
  end
end

def calculate_total_score(rslt, scr)
  if rslt == "Dealer wins!"
    scr[:dealer] += 1
  elsif rslt == "You win!"
    scr[:player] += 1
  else
    scr[:dealer] += 1
    scr[:player] += 1
  end
end

def display_total_score(scr)
  pace_interaction
  prompt "Player has #{scr[:player]} point#{s_or_not(scr[:player])}."
  prompt "Dealer has #{scr[:dealer]} point#{s_or_not(scr[:dealer])}."
end

def s_or_not(num)
  num == 1 ? '' : 's'
end

def display_total_winner(scr)
  pace_interaction
  if scr[:player] > scr[:dealer]
    prompt "You win the game!"
  elsif scr[:player] < scr[:dealer]
    prompt "Dealer wins the game!"
  else
    prompt "The game is a tie!"
  end
end

def play_again?
  pace_interaction
  answer = ''
  loop do
    prompt "Do you want to play again?"
    prompt "Press 'y' for yes and 'n' for no."
    answer = gets.chomp.downcase
    break if VALID_ANSWERS.include?(answer)
    prompt "Sorry, invalid input!"
  end
  answer.start_with?('y')
end

# Main program----------------------
clear_screen
welcome_player
loop do # main game loop
  counter = 0
  game_score = initialize_total_score
  loop do # best of five loop
    counter += 1
    display_round(counter)
    initial_deck = initalize_deck
    player_hand = initialize_hand
    dealer_hand = initialize_hand
    dealing_initial_cards(player_hand, dealer_hand, initial_deck)
    display_initial_hands(player_hand, dealer_hand)
    player_choice = retrieve_player_choice
    player_score = player_turn(player_choice, player_hand, initial_deck)
    display_player_move(player_score, dealer_hand)

    if under_22?(player_score)
      dealer_score = dealer_turn(dealer_hand, initial_deck)
      display_dealer_move(dealer_score)
      if under_22?(dealer_score)
        display_score(player_score, dealer_score)
      end
    end
    prompt display_winner(player_score, dealer_score)
    result = display_winner(player_score, dealer_score)
    calculate_total_score(result, game_score)
    display_total_score(game_score)
    break if counter >= 5
    pace_interaction
    clear_screen
  end
  display_total_winner(game_score)
  answer = play_again?
  break unless answer
  clear_screen
end

prompt "Thank you for playing 21! Goodbye!"
