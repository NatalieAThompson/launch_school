
# Nouns
# Players
#  Human choose score
#  Computer choose score
# game play winner
# choice
#  rock beats 
#  paper beats 
#  scissors beats

class Player
  attr_accessor :score, :choice
  
  def initialize
    @score = 0
  end
  
  def display_choice
    puts "#{self.class} chose #{choice}."
  end
  
 
end

class Human < Player
  attr_reader :name
  def initialize
    super
    puts "What's your name?"
    @name = gets.chomp
  end
  
  def choose
    puts "Pick rock, paper, or scissors."
    @choice = gets.chomp
  end

  def display_choice
    puts "#{name} chose #{choice}."
  end
  
end

class Computer < Player


  def choose
    @choice = %w[rock paper scissors].sample
  end
  
end

class GamePlay
  attr_accessor :human, :computer, :winner
  
  def initialize
    @human = Human.new
    @computer = Computer.new
  end
  
  def determine_winner
    if human.choice == "rock" && computer.choice == "paper"
      @winner = computer
    elsif human.choice == "rock" && computer.choice == "scissors"
      @winner =  human
    elsif human.choice == "paper" && computer.choice == "scissors"
      @winner = computer
    elsif human.choice == "paper" && computer.choice == "rock"
      @winner = human
    elsif human.choice == "scissors" && computer.choice == "rock"
      @winner = computer
    elsif human.choice == "scissors" && computer.choice == "paper"
      @winner = human
    else
      @winner = "no one"
    end
  end
  
  def update_score
    if winner == human
      human.score += 1
    elsif winner == computer
      computer.score += 1
    end
  end
  
  def display_winner
    if winner.class == Computer
      puts "The winner is #{winner.class}."
    elsif winner == human
      puts "The winner is #{human.name}."
    else 
      puts "The winner is no one."
    end
  end
  
  def play_again?
    puts "Do you want to play again?"
    choice = gets.chomp
    if choice == "yes"
      return true
    elsif choice == "no"
      return false
    end

    
  end
  
  
  def play
    loop do
      human.choose
      human.display_choice
      computer.choose
      computer.display_choice
      determine_winner
      update_score
      display_winner
      break unless play_again?
    end
  end
  
end


class Choice
  def beats
    
  end
  
end

GamePlay.new.play