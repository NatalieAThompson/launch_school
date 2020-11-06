SUITS = [:spades, :hearts, :clubs, :diamonds]

def initialize_deck
 deck = {
  :spades => [2, 3, 4, 5, 6, 7, 8, 9, 10, "A", "J", "Q", "K"],
  :hearts => [2, 3, 4, 5, 6, 7, 8, 9, 10, "A", "J", "Q", "K"],
  :clubs => [2, 3, 4, 5, 6, 7, 8, 9, 10, "A", "J", "Q", "K"],
  :diamonds => [2, 3, 4, 5, 6, 7, 8, 9, 10, "A", "J", "Q", "K"]
  }
end

def shuffle_deck(deck)
  deck.map do |key, value|
    [key, value.shuffle]
  end.to_h
end

def initialize_hand(hand, deck)
  hand = []
  2.times do
    suit = SUITS.sample
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
      sum += value
    end
  end
  
  until sum <= 21
    number_of_aces = values.count("A")
    unless number_of_aces == 0
      sum -= 10
      number_of_aces -= 1
    end
    break if number_of_aces == 0
  end

  sum
end

 
    
def display_start_cards(player_hand, dealer_hand)
  # spade = '♠'
  # heart = '♥'
  # diamond = '♦'
  # clubs = '♣'
  puts "Dealer has #{dealer_hand[0, 2]} and a mystery card."
  puts "You have #{player_hand}."
  puts "Your total is #{total(player_hand)}."
  puts "Do you want to hit or stay?"
end
  

def hit(hand, deck)
  suit = SUITS.sample
  hand << suit << deck[suit].pop
  hand
end

def display_current_cards(player_hand)
  puts "You have #{player_hand}, for a total of #{total(player_hand)}."
end

loop do
  deck = initialize_deck

  deck = shuffle_deck(deck)

  player_hand = []

  dealer_hand = []

  player_hand = initialize_hand(player_hand, deck)

  dealer_hand = initialize_hand(dealer_hand, deck)

  display_start_cards(player_hand, dealer_hand)
  
  player_busted = false
  
  dealer_busted = false

  #player_turn
  loop do
    answer = gets.chomp 
    if answer == "h"
      player_hand = hit(player_hand, deck)
      display_current_cards(player_hand)
      if total(player_hand) > 21
        puts "You busted!"
        player_busted = true
        break
      else
        puts "Do you want to hit or stay?"
        
      end
    elsif answer == "s"
      break
    end
  end
  
  #dealer_turn
  loop do
    break if total(dealer_hand) >= 17 || player_busted
    dealer_hand = hit(dealer_hand, deck)
    if total(dealer_hand) > 21
      puts "Dealer busted!"
      dealer_busted = true
      break
    end
    
  end
  
  if player_busted
    puts "Dealer won"
  elsif dealer_busted
    puts "You won!!"
  elsif total(player_hand) > total(dealer_hand)
    puts "You won!!"
  elsif total(player_hand) < total(dealer_hand)
    puts "Dealer won, with a total of #{total(dealer_hand)}."
  else
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