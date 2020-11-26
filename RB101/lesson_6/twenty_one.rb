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

def display_top_bottom(num)
  puts "+---------+  " * num
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

def display_side(hand, show_all = true)
  if ILLUSTRATION
    setup_hand_display(hand, show_all)
  elsif show_all
    format_hand(hand)
  else
    print "Mystery card, "
    format_hand(hand[2..-1])
  end
end

def display_screen(p_hand, d_hand, action, totals)
  show_all = show_mystery_card?(action)

  prompt "Dealer's hand:"
  display_side(d_hand, show_all)
  prompt "Dealer #{action} #{totals[1]}." if show_all
  puts
  prompt "Your hand:"
  display_side(p_hand)
  prompt "Your total is #{totals[0]}."
  puts
end

def format_hand(hand)
  string_ar = []

  (hand.length).times do |n|
    if n.even?
      string_ar << CARD_NAMES[CARDS.find_index(hand[n + 1])].to_s +
                   " of " +
                   hand[n].to_s.capitalize.to_s
    end
  end

  puts string_ar.join(', ')
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

def play_again?
  prompt "Do you want to play again?"

  loop do
    answer = gets.chomp.downcase

    return true if answer == 'y'
    return false if answer == 'n'

    prompt "Please enter Y/N"
  end
end

def display_bust_message(winner, loser, punctuation)
  str = "#{winner} won#{punctuation} #{loser} busted#{punctuation}"
  border = get_border_length(str)

  display_message(str, border)
end

def display_points_message(winner, punctuation, w_total, l_total)
  str = "#{winner} won#{punctuation} With a total of #{w_total} to #{l_total}."
  border = get_border_length(str)

  display_message(str, border)
end

def display_message(str, border)
  puts border
  prompt str
  puts border
end

def display_end(p_hand, d_hand, p_bust, d_bust, totals)
  if compare_points(totals[1], totals[0], p_bust)
    display_points_message("You", "!", totals[0], totals[1])
  elsif compare_points(totals[0], totals[1], d_bust)
    display_points_message("Dealer", ".", totals[1], totals[0])
  elsif p_bust
    display_bust_message("Dealer", "You", ".")
  elsif d_bust
    display_screen(p_hand, d_hand, "busted with", totals)
    display_bust_message("You", "Dealer", "!")
  else
    display_message("It's a tie.", get_border_length("It's a tie."))
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

def prompt(str)
  puts "~> " + str
end

def ask_user_fix_screen
  prompt "To see illustrations full screen your console now."

  continue?
end

def welcome_screen
  prompt "Welcome to Black Jack!"
  puts "-".ljust(IO.console.winsize[1], '-')
  ask_user_fix_screen if !check_screen_size?
  prompt "Be the first to win 5 points!"
end

def display_set_winner(points)
  if points[0] > points[1]
    prompt "You won the set!"
  else
    prompt "Better luck next time."
  end
end

def display_points(points)
  puts
  prompt "Player: #{points[0]} to Dealer: #{points[1]}."
end

def display_goodbye
  clear_screen
  prompt "Thank you for playing!"
end

def display_dealer_turn(total, hand)
  str = "Dealer is drawing cards. Current total is #{total}."
  prompt "Dealers turn"
  ILLUSTRATION ? setup_hand_display(hand) : format_hand(hand)
  puts
  puts get_border_length(str)
  prompt str
  sleep(2)
  clear_screen
end

# Helper Display Methods
def setup_hand_display(hand, show_all = true)
  value, suit = select_component(hand)
  key_to_sym!(suit)

  num = cards_for_screen_width
  loop do
    if value.length > num
      leftover = value[num..-1]
      value = value[0...num]

      s_leftover = suit[num..-1]
      suit = suit[0...num]
    end

    displaying_cards(value, suit, show_all)

    break if leftover.nil? || leftover.empty?
    value = leftover
    suit = s_leftover
  end
end

def key_to_sym!(suit)
  suit.map! { |ele| SUITS[ele] }
end

def string_setup(num1, suit, num2)
  num1 += " " if num1.length == 1
  format("|%02s  %s  %02s|  ", num1, suit, num2)
end

def cards_for_screen_width
  width = IO.console.winsize[1]

  width / 13
end

def show_mystery_card?(action)
  !(action == "stayed for" || action == "hit for")
end

def get_border_length(str)
  "-".ljust(str.length + 3, '-')
end

def check_screen_size?
  height = IO.console.winsize[0]

  height > 25
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

def select_component(hand)
  hand.partition.with_index do |_, index|
    index.odd?
  end
end

def total(hand)
  values = select_component(hand)[0]

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

def check_for_bust?(total)
  total > WINNING_NUMBER
end

def who_won(totals, player_busted, dealer_busted)
  if player_busted || compare_points(totals[0], totals[1], dealer_busted)
    'dealer'
  elsif dealer_busted || compare_points(totals[1], totals[0], player_busted)
    'player'
  end
end

def compare_points(points1, points2, bust)
  ((points1 < points2) && !bust)
end

def update_points!(points, totals, p_bust, d_bust)
  winner = who_won(totals, p_bust, d_bust)

  if winner == 'player'
    points[0] += 1
  elsif winner == 'dealer'
    points[1] += 1
  end
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

    total = [total(player_hand), total(dealer_hand)]

    display_screen(player_hand, dealer_hand, "stayed for", total)

    player_busted = false

    until player_busted
      break if valid_hit_stay == "s"
      clear_screen
      player_hand = hit!(player_hand, deck)
      total[0] = total(player_hand)
      display_screen(player_hand, dealer_hand, "hit for", total)
      player_busted = check_for_bust?(total[0])
    end

    clear_screen
    until total[1] >= DEALER_STAY || player_busted
      hit!(dealer_hand, deck)
      total[1] = total(dealer_hand)
      display_dealer_turn(total[1], dealer_hand)
    end
    dealer_busted = check_for_bust?(total[1])

    clear_screen
    display_screen(player_hand, dealer_hand, "totaled", total) if !dealer_busted
    display_end(player_hand, dealer_hand, player_busted, dealer_busted, total)
    update_points!(points, total, player_busted, dealer_busted)
    display_points(points)

    break if points.include?(5)
    continue?
  end

  display_set_winner(points)
  break unless play_again?
end

display_goodbye
