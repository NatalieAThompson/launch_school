class Player
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
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n.capitalize
  end

  def choose
    choice = nil
    loop do
      puts "Please choose (r)ock👊, (p)aper✋, (s)cissors✌, (l)izard🦎, or (sp)ock🖖:"
      choice = gets.chomp
      break if (Move::WORD_VALUES + Move::CHAR_VALUES + Move::SYMBOL_VALUES).include? choice
      puts "Sorry, invalid choice."
    end
    index = Move::WORD_VALUES.find_index(choice) || Move::CHAR_VALUES.find_index(choice)
    choice = Move::WORD_VALUES[index]
    choices << Move::SYMBOL_VALUES[index]
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
    choice =  ['scissors', 'scissors', 'scissors', 'scissors', 'scissors', 'rock', 'lizard'].sample
    self.move = Move.const_get(choice.capitalize).new
    add_to_choices(choice)
  end
end

class Chappie < Computer
  def choose
    choice = ['spock', 'spock', 'spock', 'lizard', 'lizard', 'lizard', 'scissors'].sample
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
  SYMBOL_VALUES = %w(👊 ✋ ✌ 🦎 🖖)

  def scissors?
    self.class == Scissors
  end

  def rock?
    self.class == Rock
  end

  def paper?
    self.class == Paper
  end

  def spock?
    self.class == Spock
  end

  def lizard?
    self.class == Lizard
  end

  def >(other_move)
    (other_move.scissors? && (rock? || spock?)) ||
      (other_move.rock? && (paper? || spock?)) ||
      (other_move.paper? && (scissors? || lizard?)) ||
      (other_move.spock? && (lizard? || paper?)) ||
      (other_move.lizard? && (rock? || scissors?))
  end

  def <(other_move)
    (other_move.paper? && (rock? || spock?)) ||
      (other_move.scissors? && (paper? || lizard?)) ||
      (other_move.rock? && (scissors? || lizard?)) ||
      (other_move.spock? && (scissors? || rock?)) ||
      (other_move.lizard? && (spock? || paper?))
  end

end

class Rock < Move; end
class Paper < Move; end
class Scissors < Move; end
class Lizard < Move; end
class Spock < Move; end

class RPSGame
  attr_accessor :human, :computer, :challenge, :winners

  def initialize
    @human = Human.new
    @computer = [R2D2, Hal, Chappie, Sonny, Number5].sample.new
    @winners = []
  end

  def play_again?
    puts "Would you like to play again? (Y/N)"
    yes_or_no == 'y'
  end

  def yes_or_no
    loop do
      answer = gets.chomp
      result = ['y', 'n'].include? answer.downcase
      return answer.downcase if result
      puts "Sorry, must be y or n."
    end
  end

  def play
    display_welcome_message
    loop do
      clear_screen
      human.choose
      computer.choose
      display_moves
      display_winner
      update_score if challenge
      display_score if challenge
      display_history if challenge && !winners.empty?
      break if challenge && (human.score == 10 || computer.score == 10)
      if !challenge
        break unless play_again?
      else
        continue
      end
    end
    clear_screen
    display_goodbye_message
  end

  def continue
    puts "Press any button to continue."
    con = gets.chomp
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    challenge_message
  end

  def challenge_message
    puts "First to 10 points is granted the title of Grand Winner"
    puts "Would you like to take that challenge? (Y/N)"
    yes_or_no == "y" ? @challenge = true : @challenge = false
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move.class}."
    puts "#{computer.name} chose #{computer.move.class}."
  end

  def display_winner
    if human.move > computer.move
      winners << human.name
      puts "#{human.name} won!"
    elsif human.move < computer.move
      winners << computer.name
      puts "#{computer.name} won!"
    else
      winners << "No one"
      puts "It's a tie!"
    end
  end

  def update_score
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    end
  end

  def display_score
    puts "#{human.name} currently has #{human.score}. #{computer.name} currently has #{computer.score}."
  end

  def display_history
    puts "         #{human.name}    #{computer.name}"
    winners.length.times do |index|
      puts "Round #{index + 1}: #{human.choices[index]}" + (" " * (human.name.length - 1)) + "vs #{computer.choices[index]}" + (" " * (computer.name.length - 1)) + "= #{winners[index]} won!"
    end
  end
end

RPSGame.new.play
