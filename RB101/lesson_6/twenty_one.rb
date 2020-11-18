SUITS = { spades: '♠', 
          hearts: '♥', 
          clubs: '♣', 
          diamonds: '♦'}

def initialize_deck
 deck = {
   spades: %w(2 3 4 5 6 7 8 9 10 A J Q K),
   hearts: %w(2 3 4 5 6 7 8 9 10 A J Q K),
   clubs: %w(2 3 4 5 6 7 8 9 10 A J Q K),
   diamonds: %w(2 3 4 5 6 7 8 9 10 A J Q K)
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

def initialize_hand(hand, deck)
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
  until sum <= 21
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
  
  9.times do |n|
    case n
    when 0, 8
      puts "+---------+  " * hand_size
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
      puts "|         |  " * hand_size
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
end
    
def display_cards(player_hand, dealer_hand, dealer_show_all = false)
  puts "Dealer has:" #{dealer_hand[0, 2]} and a mystery card."
  display_hand(dealer_hand, dealer_show_all)
  puts "You have:"
  display_hand(player_hand)
  puts "Your total is #{total(player_hand)}."
end
  

def hit!(hand, deck)
  suit = SUITS.keys.sample
  hand << suit << deck[suit].pop
  hand
end

loop do
  clear_screen
  deck = initialize_deck
  
  player_hand = []
  dealer_hand = []

  player_hand = initialize_hand(player_hand, deck)
  dealer_hand = initialize_hand(dealer_hand, deck)

  display_cards(player_hand, dealer_hand)
  
  player_busted = false
  dealer_busted = false

  #player_turn
  loop do
    puts "Do you want to hit or stay? (h/s)"
    answer = gets.chomp 
    if answer == "h"
      player_hand = hit!(player_hand, deck)
      clear_screen
      display_cards(player_hand, dealer_hand)
      if total(player_hand) > 21
        player_busted = true
        break
      end
    elsif answer == "s"
      break
    end
  end
  
  #dealer_turn
  loop do
    break if total(dealer_hand) >= 17 || player_busted
    dealer_hand = hit!(dealer_hand, deck)
    if total(dealer_hand) > 21
      puts "Dealer busted!"
      dealer_busted = true
      break
    end
    
  end
  
  if player_busted
    clear_screen
    display_cards(player_hand, dealer_hand, true)
    puts "Dealer won, you busted."
  elsif dealer_busted
    clear_screen
    display_cards(player_hand, dealer_hand, true)
    puts "You won!! Dealer Busted!"
  elsif total(player_hand) > total(dealer_hand)
    clear_screen
    display_cards(player_hand, dealer_hand, true)
    puts "You won!! With a total of #{total(player_hand)} to #{total(dealer_hand)}."
  elsif total(player_hand) < total(dealer_hand)
    clear_screen
    display_cards(player_hand, dealer_hand, true)
    puts "Dealer won, with a total of #{total(dealer_hand)}."
  else
    clear_screen
    display_cards(player_hand, dealer_hand, true)
    puts "It's a tie!"
  end

  puts "Do you want to play again?"
  answer = gets.chomp
  if answer == "y"  
    next
  else
    break
  end
  
end
  
puts "Thank you for playing!"