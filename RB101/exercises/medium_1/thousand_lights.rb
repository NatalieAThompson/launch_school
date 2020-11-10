# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. 
# You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, 
# you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. 
# You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on                           ['on', 'on', 'on', 'on', 'on']
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on         ['on', 'off', 'on', 'off', 'on']
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on     ['on', 'off', 'off', 'off', 'on']
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on     ['on'. 'off', 'off', 'on', 'on']
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on     ['on', 'off', 'off', 'on', 'off']
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

def switches(n)
  switch = []

  n.times {switch << true}
  counter = 2

  (1..n).each do |index|
    index_counter = 1
    switch.map! do |bool|
      if index_counter % counter == 0
         bool = !bool
      end
      index_counter += 1
      bool
    end
    counter += 1
  end

  index_ar = []
  switch.each.with_index do |bool, index|
    index_ar << index + 1 if bool
  end

  index_ar
end

p switches(5)
p switches(10)
p switches(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

=begin
switches: 1 - n
all switches are 1 light
all switches start off
lap 1: turn all lights on
lap 2: toggle lights every 2
lap 3: toggle lights every 3
-----: toggle lights every 4 switches
repeat n times

input: integer
output: array
-The output array should have the number of the lights that are on after after n laps
-So the number of laps is equal to the number of lights

Algorithm
Create an array of length n filled with true (to mean on)
Create counter starts at 2
loop n-1 times
  loop
    index_counter = 1
    if index_counter's remainder / counter is equal to 0 toggle switch
    index_counter += 1
    break loop if greater than n

0: true, 1: true, 2: true, 3: true, 4: true

Need to return the indexes of the true values + 1
-create empty index array
-loop through switch array with index
  if value is true 
    add index + 1 to the index array
return index array

=end