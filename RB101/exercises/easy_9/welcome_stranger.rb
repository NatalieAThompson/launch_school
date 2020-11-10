# Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, 
# when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, 
# :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, 
# and mentions the person's title and occupation.

def greetings(name, job)
  name = name.join(' ')
  job = job.values.join(' ')
  sprintf("Hello, %s! Nice to have a %s around.", name, job)
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> Hello, John Q Doe! Nice to have a Master Plumber around.

=begin
input: array, hash
output: string
-Array is a persons full name

Algorithm
Join the name array with spaces.
Get the values from the job hash and join them.
Format the string that I want to send back.
=end