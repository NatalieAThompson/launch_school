=begin
Ideas
To get symbols
  -windows btn + ;
  -ctrl + cmd + space (on mac)

=end

spade = '♠'
heart = '♥'
dimond = '♦'
clubs = '♣'

puts spade
puts heart
puts dimond
puts clubs

#Hollow symbols
puts "\u{2664}"	
puts "\u{2661}"	
puts "\u{2662}"	
puts "\u{2667}"

#Solid symbols
puts "\u{2660}"	
puts "\u{2665}"	
puts "\u{2666}"	
puts "\u{2663}"


puts '+------------------+'
puts '|                  |'
puts '|                  |'
puts '|                  |'
puts '|                  |'
puts '|                  |'
puts '|                  |'
puts '|                  |'
puts '|                  |'
puts '|                  |'
puts '+------------------+'

puts '+------------------+'
puts "| #{heart}                |"
puts '|                  |'
puts '|                  |'
puts '|                  |'
puts "|        2         |"
puts '|                  |'
puts '|                  |'
puts '|                  |'
puts "|                #{heart} |"
puts '+------------------+'

puts '+---------+  +---------+'
puts '| ♥       |  |         |'
puts '|         |  |         |'
puts '|    2    |  |         |'
puts '|         |  |         |'
puts '|       ♥ |  |         |'
puts '+---------+  +---------+'

=begin
Rules:
-You start with a normal 52-card deck consisting of the 4 suits (hearts, diamonds, clubs, and spades), 
and 13 values (2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace).
-The goal of Twenty-One is to try to get as close to 21 as possible, without going over. If you go over 21, it's a "bust" and you lose.
-Setup: the game consists of a "dealer" and a "player". Both participants are initially dealt 2 cards. 
The player can see their 2 cards, but can only see one of the dealer's cards.

Card	Value
2 - 10	face value
jack, queen, king	10
ace	1 or 11
-player hits (asks for a new card) until they stay (keep there current hand) or bust (go over 21 for hand values)
-Dealer turn. hits til his total is 17 or greater. If he busts player wins.
-If neither person busts then compare the totals of the player and dealer.
=end

# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

=begin
Rules:
-You start with a normal 52-card deck consisting of the 4 suits (hearts, diamonds, clubs, and spades), 
and 13 values (2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace).
-The goal of Twenty-One is to try to get as close to 21 as possible, without going over. If you go over 21, it's a "bust" and you lose.
-Setup: the game consists of a "dealer" and a "player". Both participants are initially dealt 2 cards. 
The player can see their 2 cards, but can only see one of the dealer's cards.

Card  Value
2 - 10  face value
jack, queen, king  10
ace  1 or 11
-player hits (asks for a new card) until they stay (keep there current hand) or bust (go over 21 for hand values)
-Dealer turn. hits til his total is 17 or greater. If he busts player wins.
-If neither person busts then compare the totals of the player and dealer.
=end

# Deck = {
#   spades => [2, 3, 4, 5, 6, 7, 8, 9, 10, "A", "J", "Q", "K"]
#   hearts => [2, 3, 4, 5, 6, 7, 8, 9, 10, "A", "J", "Q", "K"]
#   clubs => [2, 3, 4, 5, 6, 7, 8, 9, 10, "A", "J", "Q", "K"]
#   diamonds => [2, 3, 4, 5, 6, 7, 8, 9, 10, "A", "J", "Q", "K"]
# }

# suit = Deck.keys.sample 
# Deck[suit][0] #shuffle all the decks and pop off a value as the drawn card

# player_hand = [card1, card2] #add cards to the array
# dealer_hand = [card1, card2] 


# #method that draws out the player and dealers hands
# #pass in the suit and number of each of there cards
# puts '+---------+  +---------+'
# puts '| ♥       |  |         |'
# puts '|         |  |         |'
# puts '|    2    |  |         |'
# puts '|         |  |         |'
# puts '|       ♥ |  |         |'
# puts '+---------+  +---------+'

