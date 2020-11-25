require 'io/console'

SUITS = { spades: '♠',
          hearts: '♥',
          clubs: '♣',
          diamonds: '♦' }

CARDS = %w(2 3 4 5 6 7 8 9 10 A J Q K)

CARD_NAMES = %w(Two
                Three
                Four
                Five
                Six
                Seven
                Eight
                Nine
                Ten
                Ace
                Jack
                Queen
                King)

# Display Methods
def clear_screen
  system("clear") || system("cls")
end

# Function Methods
def initialize_deck
  deck = {}

  SUITS.each { |key, _| deck[key] = CARDS.clone }

  shuffle_deck(deck)
end

def shuffle_deck(deck)
  deck.map { |key, value| [key, value.shuffle] }.to_h
end

def initialize_hand(deck)
  hand = []

  2.times do
    suit = SUITS.keys.sample
    hand << suit << deck[suit].pop
  end

  hand
end

def select_component(hand, indexes)
  hand.select.with_index do |_, index|
    indexes == 'value' ? index.odd? : index.even?
  end
end

def total(hand)
  values = select_component(hand, 'value')

  sum = 0

  values.each do |value|
    sum += case value
           when "A"
             11
           when "J", "Q", "K"
             10
           else
             value.to_i
           end
  end

  number_of_aces = values.count("A")
  sum = ace_check(sum, number_of_aces)
end

def ace_check(sum, number_of_aces)
  until sum <= WINNING_NUMBER
    break if number_of_aces == 0
    sum -= 10
    number_of_aces -= 1
  end
  sum
end

def key_to_sym!(suit)
  suit.map! { |ele| SUITS[ele] }
end

def display_top_bottom(num)
  puts "+---------+  " * num
end

def string_setup(num1, suit, num2)
  num1 += " " if num1.length == 1
  format("|%02s  %s  %02s|  ", num1, suit, num2)
end

def display_top_value(digits, show_all)
  str = ''
  if show_all
    digits.each do |num|
      str << string_setup(num, ' ', ' ')
    end
  else
    digits.each.with_index do |num, index|
      str << if index == 0
               string_setup(' ', ' ', ' ')
             else
               string_setup(num, ' ', ' ')
             end
    end
  end
  puts str
end

def display_bottom_value(digits, show_all)
  str = ''
  if show_all
    digits.each do |num|
      str << string_setup(' ', ' ', num)
    end
  else
    digits.each.with_index do |num, index|
      str << if index == 0
               string_setup(' ', ' ', ' ')
             else
               string_setup(' ', ' ', num)
             end
    end
  end
  puts str
end

def display_suit(suit, show_all)
  str = ''
  suit.each.with_index do |s, index|
    str << if !show_all && index == 0
             string_setup(' ', ' ', ' ')
           else
             string_setup(' ', s, ' ')
           end
  end
  puts str
end

def display_empty_rows(num)
  puts "|         |  " * num
end

def displaying_cards(digits, suit, show_all)
  9.times do |n|
    case n
    when 0, 8
      display_top_bottom(digits.size)
    when 1
      display_top_value(digits, show_all)
    when 2, 3, 5, 6
      display_empty_rows(digits.size)
    when 4
      display_suit(suit, show_all)
    when 7
      display_bottom_value(digits, show_all)
    end
  end
end

def display_hand_setup(hand, show_all = true)
  value = select_component(hand, 'value')
  suit = select_component(hand, 'suit')
  key_to_sym!(suit)

  # Could calculate the amount of cards shown on a line based on screen size?
  loop do
    if value.length > 5
      leftover = value[5..-1]
      value = value[0...5]

      s_leftover = suit[5..-1]
      suit = suit[0...5]
    end

    displaying_cards(value, suit, show_all)

    break if leftover.nil? || leftover.empty?
    value = leftover
    suit = s_leftover
  end
end

def display_side(hand, show_all = true)
  if ILLUSTRATION
    display_hand_setup(hand, show_all)
  elsif show_all
    format_hand(hand)
  else
    print "Mystery card, "
    format_hand(hand[2..-1])
  end
end

def display_screen(player_hand, dealer_hand, show_all, action, p_total, d_total) #Avoid more than 5 parameters
  prompt "Dealer's hand:"
  display_side(dealer_hand, show_all)
  prompt "Dealer #{action} #{d_total}." if show_all
  puts
  prompt "You're hand:"
  display_side(player_hand)
  prompt "Your total is #{p_total}."
  puts
end

def dealer_turn
  # Maybe extract the information from display_cards_dealer_turn to this method?
end

def format_hand(hand)
  string_ar = []

  (hand.length).times do |n|
    if n.even?
      string_ar << "#{CARD_NAMES[CARDS.find_index(hand[n + 1])]} of #{hand[n].to_s.capitalize}" # Too long
    end
  end

  puts string_ar.join(', ')
end

def display_cards_dealer_turn(hand, deck, d_total)
  dealer_busted = false

  loop do
    dealer_hand = hit!(hand, deck)
    d_total = total(hand)
    ILLUSTRATION ? display_hand_setup(hand) : format_hand(hand)
    puts
    dealer_busted = check_for_bust?(d_total)
    break if dealer_busted || d_total >= DEALER_STAY
    puts "---------------------------------------------------------------"
    prompt "Dealer is drawing cards. Current total is #{d_total}."
    sleep(2)
    clear_screen
  end

  dealer_busted ? [true, d_total] : [false, d_total]
end
# This method does too much
  # Displays the dealers turn
  # Mutates the dealers hand
  # updates the dealers total
  # checks for dealer bust

def hit!(hand, deck)
  suit = SUITS.keys.sample
  number = deck[suit].pop

  while number.nil?
    suit = SUITS.keys.sample
    number = deck[suit].pop
  end

  hand << suit << number
  hand
end

def valid_hit_stay
  prompt "Do you want to (h)it or (s)tay?"
  loop do
    answer = gets.chomp.downcase

    if answer == 'h' || answer == 's'
      return answer
    end

    prompt "Enter h/s"
  end
end

def check_for_bust?(total)
  total > WINNING_NUMBER
end

def play_again?
  prompt "Do you want to play again?"

  loop do
    answer = gets.chomp.downcase

    return true if answer == 'y'
    return false if answer == 'n'

    prompt "Please enter Y/N"
  end
end

#Complexity too high
def who_won(p_total, d_total, player_busted, dealer_busted)
  if player_busted || (p_total < d_total && !dealer_busted)
    'dealer'
  elsif dealer_busted || (p_total > d_total && !player_busted)
    'player'
  end
end

# ABC Size too big
def display_ending(player_hand, dealer_hand, player_busted, dealer_busted, p_total, d_total) # Too long
  clear_screen
  if player_busted
    display_screen(player_hand, dealer_hand, true, "totaled", p_total, d_total)
    puts "-------------------------"
    prompt "Dealer won, you busted."
    puts "-------------------------"
  elsif dealer_busted
    display_screen(player_hand, dealer_hand, true, "busted with", p_total, d_total) #Too long
    puts "--------------------------"
    prompt "You won!! Dealer Busted!"
    puts "--------------------------"
  elsif p_total > d_total
    display_screen(player_hand, dealer_hand, true, "totaled", p_total, d_total)
    puts "-----------------------------------------------------"
    prompt "You won!! With a total of #{p_total} to #{d_total}."
    puts "-----------------------------------------------------"
  elsif p_total < d_total
    display_screen(player_hand, dealer_hand, true, "totaled", p_total, d_total)
    puts "-----------------------------------------"
    prompt "Dealer won, with a total of #{d_total}."
    puts "-----------------------------------------"
  else
    display_screen(player_hand, dealer_hand, true, "totaled", p_total, d_total)
    puts "-------------"
    prompt "It's a tie!"
    puts "-------------"
  end
end

def update_points!(points, p_total, d_total, p_bust, d_bust)
  winner = who_won(p_total, d_total, p_bust, d_bust)

  if winner == 'player'
    points[0] += 1
  elsif winner == 'dealer'
    points[1] += 1
  end
end

def continue?
  prompt "Press c to continue."

  loop do
    continue = gets.chomp.downcase

    return true if continue == 'c'
  end
end

def set_number
  puts "What number would you like to play to?"
  puts "Pick a number between 21 & 101 that ends with a 1."

  loop do
    answer = gets.chomp.to_i

    return answer if answer >= 21 && answer.digits[0] == 1 && answer <= 101

    prompt "Please select the target score."
  end
end

def check_screen_size?
  height, width = IO.console.winsize

  height > 32 && width > 63
end

def prompt(str)
  puts "~> " + str
end

def ask_user_fix_screen
  prompt "To see illustrations full screen your console now."

  continue?
end

def welcome_screen
  prompt "Welcome to Black Jack!"
  puts "-------------------------------------------------"
  ask_user_fix_screen if !check_screen_size?
  prompt "Be the first to win 5 points!"
end

welcome_screen
WINNING_NUMBER = set_number
DEALER_STAY = WINNING_NUMBER - 4
ILLUSTRATION = check_screen_size?

loop do
  points = [0, 0]

  loop do
    clear_screen
    deck = initialize_deck

    player_hand = initialize_hand(deck)
    dealer_hand = initialize_hand(deck)

    player_total = total(player_hand)
    dealer_total = total(dealer_hand)

    display_screen(player_hand, dealer_hand, false, "stayed for", player_total, dealer_total) #too long

    player_busted = false
    dealer_busted = false

    # player_turn
    until player_busted
      break if valid_hit_stay == "s"
      clear_screen
      player_hand = hit!(player_hand, deck)
      player_total = total(player_hand)
      display_screen(player_hand, dealer_hand, false, "hit for", player_total, dealer_total) #Too long
      player_busted = check_for_bust?(player_total)
    end
    
    clear_screen
    prompt "Dealers turn"
    unless dealer_total >= DEALER_STAY || player_busted
      dealer_busted, dealer_total = display_cards_dealer_turn(dealer_hand, deck, dealer_total) #Too long
    end

    display_ending(player_hand, dealer_hand, player_busted, dealer_busted, player_total, dealer_total) #Too long
    update_points!(points, player_total, dealer_total, player_busted, dealer_busted) #Too long
    puts
    prompt "Player: #{points[0]} to Dealer: #{points[1]}."

    break if points.include?(5)
    continue?
  end

  if points[0] > points[1]
    prompt "You won the set!"
  else
    prompt "Better luck next time."
  end
  break unless play_again?
end

clear_screen
prompt "Thank you for playing!"
