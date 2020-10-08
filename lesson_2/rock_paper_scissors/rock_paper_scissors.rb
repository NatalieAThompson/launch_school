VALID_CHOICES = %w(rock paper scissors lizard spock)
CHOICE_ABBREVIATION = %w(r p s l sp)
WHAT_BEATS_WHAT = { 'rock' => ['scissors', 'lizard'],
                    'paper' => ['spock', 'rock'],
                    'scissors' => ['paper', 'lizard'],
                    'lizard' => ['paper', 'spock'],
                    'spock' => ['rock', 'scissors'] }

def clear_screen
  system('clear') || system('cls')
end

def prompt(message)
  puts("~> #{message}")
end

def display_welcome
  prompt "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  prompt "------------------------------------------------"
  prompt "The first player to 5 points is the Grand Winner!"
  prompt "Enter a username"
end

def won?(player1, player2)
  WHAT_BEATS_WHAT[player1].include?(player2)
end

def winner(player1, player2)
  if won?(player1, player2)
    'player'
  elsif won?(player2, player1)
    'computer'
  else
    'no one'
  end
end

def display_results(who_won)
  if who_won == 'player'
    prompt("You won!")
  elsif who_won == 'computer'
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def get_user_choice
  prompt("Choose word or abbreviation")
  VALID_CHOICES.each_index do |i|
    print "#{VALID_CHOICES[i]}(#{CHOICE_ABBREVIATION[i]}) "
  end
  puts ""

  loop do
    choice = gets.chomp.downcase

    if CHOICE_ABBREVIATION.include?(choice)
      return VALID_CHOICES[CHOICE_ABBREVIATION.index(choice)]
    elsif VALID_CHOICES.include?(choice)
      return choice
    else
      prompt("That's not a valid choice.")
    end
  end
end

def display_choices(choice, computer_choice)
  prompt "You chose: #{choice}; Computer chose: #{computer_choice}"
end

=begin
def keep_score(player1, player2)
  won?(player1, player2) ? 1 : 0
end
=end

def play_again?
  loop do
    answer = gets.chomp
    if answer.downcase == 'y'
      return true
    elsif answer.downcase == 'n'
      return false
    else
      prompt "Enter Y or N"
    end
  end
end

def display_scores(username, player_score, computer_score)
  prompt("#{username}: #{player_score} | Computer: #{computer_score}")
end

def display_winning_losing(player_score)
  if player_score == 5
    prompt("You are the Grand Winner!")
  else
    prompt("Aww... Maybe next time.")
  end
end

def valid_username
  loop do
    username = gets.chomp

    if !username.delete(' ').empty?
      return username
    else
      puts "Don't leave the username blank."
    end
  end
end

clear_screen
display_welcome
username = valid_username

loop do
  player_score = 0
  computer_score = 0

  loop do
    clear_screen
    choice = get_user_choice
    computer_choice = VALID_CHOICES.sample
    display_choices(choice, computer_choice)
    who_won = winner(choice, computer_choice)
    display_results(who_won)
    if who_won == 'player'
      player_score += 1
    elsif who_won == 'computer'
      computer_score += 1
    end
    display_scores(username, player_score, computer_score)

    break if player_score == 5 || computer_score == 5
    prompt("Go for Grand Winner? (Y/N)")
    break unless play_again?
  end

  if player_score == 5 || computer_score == 5
    display_winning_losing(player_score)
  else
    break
  end

  prompt("Do you want to play again? (Y/N)")
  break unless play_again?
end

clear_screen
prompt("Thank you for playing. Good Bye!")
