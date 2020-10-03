require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'es'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.match?(/^-?\d+$/)
end

=begin
def float?(num)
  /\d/.match?(input) && /^-?\d*\.?\d*$/.match?(input)
end
=end

def operation_to_message(op)
  message = case op
            when '1'
              'Adding'
            when '2'
              'Subtracting'
            when '3'
              'Multiplying'
            when '4'
              'Dividing'
            end
  
  message
end

prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = gets.chomp

  if name.empty?()
    prompt(messages('vaild_name', LANGUAGE))
  else
    break
  end
end

prompt(messages('hi', LANGUAGE) + name)

loop do # main loop
  num = ''
  loop do
    prompt(messages('pick', LANGUAGE))
    num = gets.chomp

    if valid_number?(num)
      break
    else
      prompt(messages('not_valid', LANGUAGE))
    end
  end

  num2 = ''
  loop do
    prompt(messages('pick', LANGUAGE))
    num2 = gets.chomp

    if valid_number?(num2)
      break
    else
      prompt(messages('not_vaild', LANGUAGE))
    end
  end

  prompt(messages('operator_prompt', LANGUAGE))
  prompt(messages('add', LANGUAGE))
  prompt(messages('sub', LANGUAGE))
  prompt(messages('multi', LANGUAGE))
  prompt(messages('divide', LANGUAGE))

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('operator_error', LANGUAGE))
    end
  end

  prompt(operation_to_message(operator) + messages('stating_intent', LANGUAGE))

  result =  case operator
            when "1"
              num.to_i + num2.to_i
            when "2"
              num.to_i - num2.to_i
            when "3"
              num.to_i * num2.to_i
            when "4"
              num.to_f / num2.to_f
            end

  prompt(result)

  prompt(messages('again', LANGUAGE))
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(messages('bye', LANGUAGE))
