module Messageable
  def prompt(message)
    puts "~> #{message}"
  end
end

class Player
  include Messageable
  attr_accessor :move, :name, :score, :choices

  def initialize
    @score = 0
    set_name
    @choices = []
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      prompt "What's your name?"
      n = gets.chomp
      break unless n.empty?
      prompt "Sorry, must enter a value."
    end
    self.name = n.capitalize
  end

  def add_to_choices(index)
    choices << Move::SYMBOL_VALUES[index]
  end

  def find(choice)
    index = Move::WORD_VALUES.find_index(choice)
    index ||= Move::CHAR_VALUES.find_index(choice)
    add_to_choices(index)
    Move::WORD_VALUES[index]
  end

  def choose
    choice = nil
    loop do
      prompt "Choose (r)ock👊, (p)aper✋, (s)cissors✌, (l)izard🦎, or (sp)ock🖖:"
      choice = gets.chomp
      break if (Move::VALUES).include? choice
      prompt "Sorry, invalid choice."
    end
    choice = find(choice)
    self.move = Move.const_get(choice.capitalize).new
  end
end

class Computer < Player
  def set_name
    self.name = self.class.to_s
  end

  def choose
    choice = Move::WORD_VALUES.sample
    self.move = Move.const_get(choice.capitalize).new
    add_to_choices(choice)
  end

  def add_to_choices(choice)
    index = Move::WORD_VALUES.find_index(choice)
    choices << Move::SYMBOL_VALUES[index]
  end
end

class R2D2 < Computer
  def choose
    self.move = Paper.new
    add_to_choices('paper')
  end
end

class Hal < Computer
  def choose
    choice = ['scissors', 'scissors', 'scissors', 'rock', 'lizard'].sample
    self.move = Move.const_get(choice.capitalize).new
    add_to_choices(choice)
  end
end

class Chappie < Computer
  def choose
    choice = ['spock', 'spock', 'lizard', 'lizard', 'scissors'].sample
    self.move = Move.const_get(choice.capitalize).new
    add_to_choices(choice)
  end
end

class Sonny < Computer; end

class Number5 < Computer
  def choose
    choice = ['rock', 'paper', 'scissors'].sample
    self.move = Move.const_get(choice.capitalize).new
    add_to_choices(choice)
  end
end

class Move
  WORD_VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  CHAR_VALUES = ['r', 'p', 's', 'l', 'sp']
  SYMBOL_VALUES = ["👊", "✋", "✌ ", "🦎", "🖖"]
  VALUES = WORD_VALUES + CHAR_VALUES + SYMBOL_VALUES

  def scissors?
    instance_of?(Scissors)
  end

  def rock?
    instance_of?(Rock)
  end

  def paper?
    instance_of?(Paper)
  end

  def spock?
    instance_of?(Spock)
  end

  def lizard?
    instance_of?(Lizard)
  end
end

class Rock < Move
  def >(other_move)
    other_move.scissors? || other_move.lizard?
  end

  def <(other_move)
    other_move.paper? || other_move.spock?
  end
end

class Paper < Move
  def >(other_move)
    other_move.rock? || other_move.spock?
  end

  def <(other_move)
    other_move.scissors? || other_move.lizard?
  end
end

class Scissors < Move
  def >(other_move)
    other_move.paper? || other_move.lizard?
  end

  def <(other_move)
    other_move.rock? || other_move.spock?
  end
end

class Lizard < Move
  def >(other_move)
    other_move.spock? || other_move.paper?
  end

  def <(other_move)
    other_move.rock? || other_move.scissors?
  end
end

class Spock < Move
  def >(other_move)
    other_move.scissors? || other_move.rock?
  end

  def <(other_move)
    other_move.lizard? || other_move.paper?
  end
end

class RPSGame
  include Messageable
  attr_accessor :human, :computer, :challenge, :winners

  def initialize
    display_welcome_message
    @human = Human.new
    @computer = [R2D2, Hal, Chappie, Sonny, Number5].sample.new
    @winners = []
  end

  # Display Methods
  def clear_screen
    system('clear') || system('cls')
  end

  def display_welcome_message
    clear_screen
    prompt "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts "---------------------------------------------------"
    challenge_message
  end

  def challenge_message
    prompt "First to 10 points is granted the title of Grand Winner"
    prompt "Would you like to take that challenge? (Y/N)"
    @challenge = yes_or_no == "y"
  end

  def play_again?
    prompt "Would you like to play again? (Y/N)"
    yes_or_no == 'y'
  end

  def yes_or_no
    loop do
      answer = gets.chomp
      result = ['y', 'n'].include? answer.downcase
      return answer.downcase if result
      prompt "Sorry, must be y or n."
    end
  end

  def continue
    prompt "Press any button to continue."
    gets.chomp
  end

  def display_goodbye_message
    clear_screen
    display_closing if human.score == 10 || computer.score == 10
    prompt "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_closing
    display_history
    puts "-------------------------------------------------"
    if human.score == 10
      prompt "#{human.name} is the Grand Winner!"
    else
      prompt "#{computer.name} is the Grand Winner, better luck next time!"
    end
    puts "-------------------------------------------------"
  end

  def display_history
    clear_screen
    prompt "         #{human.name}     #{computer.name}"
    display_each_round
    puts
    display_score
  end

  def display_each_round
    winners.length.times do |idx|
      prompt("Round #{idx + 1}: #{human.choices[idx]} #{spaces(human)}" \
            "vs #{computer.choices[idx]} #{spaces(computer)} = #{winners[idx]}")
    end
  end

  def spaces(object)
    " " * object.name.length
  end

  def display_moves
    clear_screen
    prompt "#{human.name} chose #{human.move.class}."
    prompt "#{computer.name} chose #{computer.move.class}."
  end

  def display_score
    prompt("#{human.name} currently has #{human.score}. " \
           "#{computer.name} currently has #{computer.score}.")
  end

  def display_winner
    display_moves
    prompt winners.last
    puts
  end

  # Helper Methods
  def update_winners
    winners << if human.move > computer.move
                 "#{human.name} won!"
               elsif human.move < computer.move
                 "#{computer.name} won!"
               else
                 "It's a tie!"
               end
  end

  # Function Methods
  def play
    game_loop
    display_goodbye_message
  end

  def game_loop
    loop do
      make_choices
      if challenge
        update_score
        break if human.score == 10 || computer.score == 10
        next if continue
      end
      display_winner
      break unless play_again?
    end
  end

  def make_choices
    clear_screen
    human.choose
    computer.choose
    update_winners
  end

  def update_score
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    end
    display_history
  end
end

RPSGame.new.play
