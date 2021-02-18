# Using the Card class from the previous exercise, create a Deck class that contains all of the standard 52 playing cards. Use the following code to start your work:
class Card
  include Comparable
  
  attr_reader :rank, :suit
  
  VALUES = {'Ace' => 14,
            'King' => 13,
            'Queen' => 12,
            'Jack' => 11 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  
  def <=>(object)
    determine_value <=> object.determine_value
  end
  
  def determine_value
    case rank
    when Integer
      rank
    when String
      VALUES[rank]
    end
  end
  
  def to_s
    "#{suit} of #{rank}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  
  def initialize
    create
  end
  
  def start
    cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        cards << Card.new(rank, suit)
      end
    end
    cards
  end
  
  def shuffle
    @cards.shuffle!
  end
  
  def create
    @cards = start
    shuffle
  end
  
  def draw
    create if @cards.empty? 
    @cards.pop
  end
end
# The Deck class should provide a #draw method to deal one card. The Deck should be shuffled when it is initialized and, if it runs out of cards, it should reset itself by generating a new set of 52 shuffled cards.

# Examples:

# Copy Code
deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
# Note that the last line should almost always be true; if you shuffle the deck 1000 times a second, you will be very, very, very old before you see two consecutive shuffles produce the same results. If you get a false result, you almost certainly have something wrong.