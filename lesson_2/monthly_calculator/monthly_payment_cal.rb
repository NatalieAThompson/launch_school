def prompt(str)
  puts("~> #{str}")
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

prompt "Welcome to a monthly payment calculator!"
prompt "----------------------------------------"

loop do
  prompt "What is the total amount due on your loan?"
  principle = ''

  loop do
    principle = gets.chomp

    if valid_number?(principle)
      break
    else
      prompt "Please enter a positive number and don't include commas."
    end
  end

  prompt "What is your APR (Annual Percentage Rate)? Write only the number."
  apr = ''

  loop do
    apr = gets.chomp

    if valid_number?(apr)
      break
    else
      prompt "Please enter a valid APR and don't include the percent sign"
    end
  end

  mpr = (apr.to_f / 100) / 12.0

  prompt "What is the duration of the loan? Please specify years and/or months."
  months = 0

  loop do
    duration = gets.chomp

    if duration_to_months(duration)
      months = duration_to_months(duration)
      break
    else
      prompt "Please enter a number of years and/or months."
    end
  end

  monthly_payments = principle.to_f * (mpr / (1 - (1 + mpr)**-months))

  prompt ""
  prompt "Based on the information you provided"
  prompt "Principle: #{principle}"
  prompt "APR: #{apr}%"
  prompt "Duration in Months: #{months}"
  prompt ""
  prompt "Your monthly payment would be: $#{monthly_payments.round(2)}"
  prompt "--------------------------------------"
  prompt "Would you like to find the monthly payment for another loan? (Y/N)"
  again = gets.chomp

  break unless again.downcase.start_with?('y')
end
