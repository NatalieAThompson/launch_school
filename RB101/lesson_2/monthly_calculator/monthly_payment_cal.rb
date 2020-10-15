def prompt(str)
  puts("~> #{str}")
end

def clear_screen
  system 'clear'
  system 'cls'
end

def valid_number?(num)
  num.match?(/^\d+\.?\d*$/)
end

def year_or_months?(str)
  type = str.scan(/[a-zA-Z]+/)

  type.length == 1 ? type[0].downcase.start_with?('y') : false
end

def duration_to_months(str)
  ar = str.scan(/\d+/)

  if ar.length == 1
    if year_or_months?(str)
      ar[0].to_i * 12
    else
      ar[0].to_i
    end
  elsif ar.length == 2
    (ar[0].to_i * 12) + ar[1].to_i
  end
end

def print_welcome_message
  prompt "Welcome to a monthly payment calculator!"
  prompt "----------------------------------------"
end

def get_loan_amount
  prompt "What is the total amount due on your loan?"

  loop do
    principle = gets.chomp

    if valid_number?(principle)
      return principle
    else
      prompt "Please enter a positive number and don't include commas."
    end
  end
end

def get_apr
  prompt "What is your APR (Annual Percentage Rate)? Write only the number."

  loop do
    apr = gets.chomp

    if valid_number?(apr)
      return apr
    else
      prompt "Please enter a valid APR and don't include the percent sign"
    end
  end
end

def get_time_on_loan
  prompt "What is the duration of the loan?"
  prompt "example: 5 years 3 months or 5y3m"

  loop do
    duration = gets.chomp

    if duration_to_months(duration)
      return duration_to_months(duration)
    else
      prompt "Please enter a number of years and/or months."
    end
  end
end

def compute_result(principle, apr, months)
  mpr = (apr.to_f / 100) / 12.0

  principle.to_f * (mpr / (1 - (1 + mpr)**-months))
end

def display_result(principle, apr, months, monthly_payments)
  prompt ""
  prompt "Based on the information you provided"
  prompt "Principle: #{principle}"
  prompt "APR: #{apr}%"
  prompt "Duration in Months: #{months}"
  prompt ""
  prompt "Your monthly payment would be: $#{monthly_payments.round(2)}"
  prompt "--------------------------------------"
end

def play_again?
  prompt "Would you like to find the monthly payment for another loan? (Y/N)"
  again = gets.chomp

  again.downcase.start_with?('y')
end

print_welcome_message

loop do
  principle = get_loan_amount
  apr = get_apr
  months = get_time_on_loan
  monthly_payments = compute_result(principle, apr, months)
  display_result(principle, apr, months, monthly_payments)

  break unless play_again?
  clear_screen
end

clear_screen
