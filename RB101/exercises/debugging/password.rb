def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  password = new_password
end

password = set_password

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

verify_password(password)