module Messageable
  def prompt(message)
    puts "~> #{message}"
  end
end

class Player
  include Messageable
  attr_accessor :move, :name, :score, :choices

  def initialize(challenge = 'y')
    @score = 0
    set_name if challenge == 'y'
    @choices = []
  end
end

class Human < Player
  attr_accessor :current_choice

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

  def included_choice?(choice)
    Move::POSSIBLE_CHOICES.each do |values|
      values.each do |_, value|
        if value == choice.downcase
          choices << values[:emoji]
          @current_choice = values[:full_name]
          return true
        end
      end
    end
    false
  end

  def choose
    choice = nil
    loop do
      prompt "Choose (r)ock👊, (p)aper✋, (s)cissors✌, (l)izard🦎, or (sp)ock🖖:"
      choice = gets.chomp
      break if included_choice?(choice)
      prompt "Sorry, invalid choice."
    end
    self.move = Move.const_get(current_choice.capitalize).new
  end
end

class Computer < Player
  attr_accessor :options

  def set_name
    self.name = self.class.to_s
  end

  def choose
    self.move = options.sample.new
    add_to_choices
  end

  def add_to_choices
    choices << move.emoji
  end
end

class R2D2 < Computer
  def initialize
    self.options = [Paper]
    super
  end
end

class Hal < Computer
  def initialize
    self.options = [Scissors, Scissors, Scissors, Rock, Lizard]
    super
  end
end

class Chappie < Computer
  def initialize
    self.options = [Spock, Spock, Lizard, Lizard, Scissors]
    super
  end
end

class Sonny < Computer
  def initialize
    self.options = [Rock, Paper, Scissors, Lizard, Spock]
    super
  end
end

class Number5 < Computer
  def initialize
    self.options = [Rock, Paper, Scissors]
    super
  end
end

class Move
  attr_reader :emoji, :beats

  POSSIBLE_CHOICES = [
    { full_name: 'rock', short_name: 'r', emoji: "👊" },
    { full_name: 'paper', short_name: 'p', emoji: "✋" },
    { full_name: 'scissors', short_name: 's', emoji: "✌ " },
    { full_name: 'lizard', short_name: 'l', emoji: "🦎" },
    { full_name: 'spock', short_name: 'sp', emoji: "🖖" }
  ]

  def >(other_move)
    other_move.is_a?(beats[0]) || other_move.is_a?(beats[1])
  end
end

class Rock < Move
  def initialize
    super
    @emoji = "👊"
    @beats = [Scissors, Lizard]
  end
end

class Paper < Move
  def initialize
    super
    @emoji = "✋"
    @beats = [Rock, Spock]
  end
end

class Scissors < Move
  def initialize
    super
    @emoji = "✌ "
    @beats = [Paper, Lizard]
  end
end

class Lizard < Move
  def initialize
    super
    @emoji = "🦎"
    @beats = [Spock, Paper]
  end
end

class Spock < Move
  def initialize
    super
    @emoji = "🖖"
    @beats = [Scissors, Rock]
  end
end

class RPSGame
  include Messageable
  attr_accessor :human, :computer, :challenge, :winners

  POINTS = 10

  def initialize
    display_welcome_message
    @human = Human.new(challenge)
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
    prompt "First to #{POINTS} points is granted the title of Grand Winner"
    prompt "Would you like to take that challenge? (Y/N)"
    @challenge = yes_or_no
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
    display_closing if human.score == POINTS || computer.score == POINTS
    prompt "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_closing
    display_history
    puts "-------------------------------------------------"
    if human.score == POINTS
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

  def display_score
    prompt("#{human.name} currently has #{human.score}. " \
           "#{computer.name} currently has #{computer.score}.")
  end

  # Helper Methods
  def update_winners
    winners << if human.move > computer.move
                 "#{human.name} won!"
               elsif computer.move > human.move
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
      break if challenge == 'n'
      make_choices
      update_score
      break if human.score == POINTS || computer.score == POINTS
      next if continue
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
    elsif computer.move > human.move
      computer.score += 1
    end
    display_history
  end
end

RPSGame.new.play
