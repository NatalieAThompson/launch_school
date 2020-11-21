SUITS = { spades: '♠', 
          hearts: '♥', 
          clubs: '♣', 
          diamonds: '♦'}

CARDS = %w(2 3 4 5 6 7 8 9 10 A J Q K) #can I use this constant or will it mess up shuffle?

def initialize_deck
 deck = {
   spades: CARDS.clone, 
   hearts: CARDS.clone,
   clubs: CARDS.clone,
   diamonds: CARDS.clone
  }
  
  shuffle_deck(deck)
end

def clear_screen
  system("clear") || system("cls")
end

def shuffle_deck(deck)
  deck.map do |key, value|
    [key, value.shuffle]
  end.to_h
end

def initialize_hand(deck)
  hand = []
  2.times do
    suit = SUITS.keys.sample
    hand << suit << deck[suit].pop
  end
  hand
end

def total(hand)
  values = hand.select.with_index do |_, index|
    index.odd?
  end

  sum = 0

  values.each do |value|
    if value == "A"
      sum += 11
    elsif value == "J" || value == "Q" || value == "K"
      sum += 10
    else
      sum += value.to_i
    end
  end
  
  number_of_aces = values.count("A")
  until sum <= WINNING_NUMBER
    unless number_of_aces == 0
      sum -= 10
      number_of_aces -= 1
    end
    break if number_of_aces == 0
  end

  sum
end

def display_hand(hand, show_all = true)
  hand_size = hand.length / 2
  digits = hand.select.with_index { |_, index| index.odd? }
  suit = hand.select.with_index { |_, index| index.even? }
  suit.map! { |ele| SUITS[ele] }
  
  #need to break the digits array into nested arrays with only 5 elements each?
  loop do
    if digits.length > 5
      leftover = digits[5..-1]
      digits = digits[0...5]
      
      s_leftover = suit[5..-1]
      suit = suit[0...5]
    end
    
    9.times do |n|
      case n
      when 0, 8
        puts "+---------+  " * digits.size
      when 1
        str = ''
        if show_all
          digits.each do |num|
            num.length == 1 ? str << "|#{num}        |  " : str << "|#{num}       |  "
          end
        else
          digits.each.with_index do |num, index|
            if index == 0 
              str << "|         |  "
            else
              num.length == 1 ? str << "|#{num}        |  " : str << "|#{num}       |  "
            end
          end
        end
        puts str
      when 2, 3, 5, 6
        puts "|         |  " * digits.size
      when 4
        str = ''
        suit.each.with_index do |s, index|
          if !show_all && index == 0 
            str << "|         |  "
          else
            str << "|    #{s}    |  "
          end
        end
        puts str
      when 7
        str = ''
        if show_all
          digits.each do |num|
            num.length == 1 ? str << "|        #{num}|  " : str << "|       #{num}|  "
          end
        else
          digits.each.with_index do |num, index|
            if index == 0 
              str << "|         |  "
            else
              num.length == 1 ? str << "|        #{num}|  " : str << "|       #{num}|  "
            end
          end
        end
        puts str
      end
    end
    
    break if leftover == nil || leftover.empty?
    digits = leftover
    suit = s_leftover
  end
end
#Need to break this method into parts and I need to look up how to handle the end of the screen.
#Maybe if a hand has more than 5 cards this loops for the rest of the cards?
    
def display_cards(player_hand, dealer_hand, dealer_show_all = false, action = "stayed for", p_total, d_total)
  puts "Dealer's hand:"
  display_hand(dealer_hand, dealer_show_all)
  puts "Dealer #{action} #{d_total}." if dealer_show_all
  puts
  puts "You're hand:"
  display_hand(player_hand)
  puts "Your total is #{p_total}."
  puts
end

def display_cards_dealer_turn(player_hand, dealer_hand, deck, d_total)
  dealer_busted = false
  
  loop do
    dealer_hand = hit!(dealer_hand, deck)
    d_total = total(dealer_hand)
    display_hand(dealer_hand)
    dealer_busted = check_for_bust?(dealer_hand, d_total)
    break if dealer_busted || d_total >= DEALER_STAY
    puts "---------------------------------------------------------------"
    puts "Dealer is drawing cards. Current total is #{d_total}."
    sleep(3)
    clear_screen
  end
  
  dealer_busted ? [true, d_total] : [false, d_total]
end
#This method does too much
  #Displays the dealers turn
  #Mutates the dealers hand
  #updates the dealers total
  #checks for dealer bust

def hit!(hand, deck)
  suit = SUITS.keys.sample
  hand << suit << deck[suit].pop
  hand
end

def valid_hit_stay
  puts "Do you want to (h)it or (s)tay?"
  loop do
    answer = gets.chomp.downcase
    
    if answer == 'h' || answer == 's'
      return answer
    end
    
    puts "Enter h/s"
  end
end

def check_for_bust?(hand, total)
  return true if total > WINNING_NUMBER
  false
end

def play_again?
  puts "Do you want to play again?"
  
  loop do
    answer = gets.chomp.downcase
    
    return true if answer == 'y'
    return false if answer == 'n'
    
    puts "Please enter Y/N"
  end
end

def who_won(p_total, d_total, player_busted, dealer_busted)
  if player_busted || (p_total < d_total && !dealer_busted)
    'dealer'
  elsif dealer_busted || (p_total > d_total && !player_busted)
    'player'
  end
end


def display_ending(player_hand, dealer_hand, player_busted, dealer_busted, p_total, d_total)
   if player_busted
    clear_screen
    display_cards(player_hand, dealer_hand, true, "totaled", p_total, d_total)
    puts "-----------------------"
    puts "Dealer won, you busted."
    puts "-----------------------"
  elsif dealer_busted
    clear_screen
    display_cards(player_hand, dealer_hand, true, "busted with", p_total, d_total)
    puts "------------------------"
    puts "You won!! Dealer Busted!"
    puts "------------------------"
  elsif p_total > d_total
    clear_screen
    display_cards(player_hand, dealer_hand, true, "totaled", p_total, d_total)
    puts "---------------------------------------------------"
    puts "You won!! With a total of #{p_total} to #{d_total}."
    puts "---------------------------------------------------"
  elsif p_total < d_total
    clear_screen
    display_cards(player_hand, dealer_hand, true, "totaled", p_total, d_total)
    puts "---------------------------------------"
    puts "Dealer won, with a total of #{d_total}."
    puts "---------------------------------------"
  else
    clear_screen
    display_cards(player_hand, dealer_hand, true, "totaled", p_total, d_total)
    puts "-----------"
    puts "It's a tie!"
    puts "-----------"
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
  puts "Press c to continue."

  loop do
    continue = gets.chomp.downcase

    return true if continue == 'c'
  end
end

def set_name
  puts "Please enter a username"

  loop do
    name = gets.chomp.capitalize

    return name unless name.empty?
    puts "Please enter a name."
  end
end

def set_number
  choices = %w(21 31 41 51 61 71 81 91)
  puts "What number would you like to play to?"
  puts choices.join(', ')
  
  loop do
    answer = gets.chomp
    
    return answer.to_i if choices.include?(answer)
    
    puts "Please select the target score."
  end
end

puts "Welcome to Twenty-One"
puts "Be the first to win 5 points!"
USERNAME = set_name
WINNING_NUMBER = set_number
DEALER_STAY = WINNING_NUMBER - 4

loop do
  points = [0, 0]

  loop do
    clear_screen
    deck = initialize_deck

    player_hand = initialize_hand(deck)
    dealer_hand = initialize_hand(deck)

    player_total = total(player_hand)
    dealer_total = total(dealer_hand)

    display_cards(player_hand, dealer_hand, false, "stayed for", player_total, dealer_total)
    
    player_busted = false
    dealer_busted = false

    #player_turn
    until player_busted
      break if valid_hit_stay == "s"
      clear_screen
      player_hand = hit!(player_hand, deck)
      player_total = total(player_hand)
      display_cards(player_hand, dealer_hand, false, "hit for", player_total, dealer_total)
      player_busted = check_for_bust?(player_hand, player_total)
    end
    
    clear_screen
    puts "Dealers turn"
    unless dealer_total >= DEALER_STAY || player_busted
      dealer_busted, dealer_total = display_cards_dealer_turn(player_hand, dealer_hand, deck, dealer_total) 
    end
    
    display_ending(player_hand, dealer_hand, player_busted, dealer_busted, player_total, dealer_total)
    update_points!(points, player_total, dealer_total, player_busted, dealer_busted)
    puts "#{USERNAME}: #{points[0]} to Dealers: #{points[1]}."
    
    break if points.include?(5)
    continue?
  end

  if points[0] > points[1]
    puts 
    puts "You won the set!"
    puts
  else
    puts 
    puts "Better luck next time."
    puts
  end
  break unless play_again?
end

clear_screen
puts "Thank you for playing!"