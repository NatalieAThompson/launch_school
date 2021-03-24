module Messageable
  def prompt(message)
    puts "~> #{message}"
  end
end

class Deck
  def initialize
    @cards = []
    #build a deck of 52 cards
    #shuffle that deck
  end

  def shuffle

  end

  def deal

  end
end

class Card
  def initialize
    @value
    @suit
    @color
  end

  def >(object)

  end
end

class Participant
  def initialize
    @name
    @bust = false
    @total
    @points = 0
  end
end

class Player < Participant
  def name=(input)
    #guard clause against empty strings?
  end
end

class Dealer < Participant

end

class TOGame
  include Messageable

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def play
    display_welcome
    deck.deal
    player_turn
    dealer_turn
    display_winner
    display_goodbye
  end

  private

  def display_welcome
    prompt "Hello! Welcome to BlackJack!"
    prompt "What would you like to be called?"
  end
end

TOGame.new.play