# You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, 
# but with each word's characters reversed. Given the method's implementation, will the returned string be the same object as 
# the one passed in as an argument or a different object?


def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

=begin

line 12: called the spin_me method and passes in the string "Hello world" as an argument
Lines 6 - 10 define the spin_me method
  Line 7: calls the split method on `str` variable which creates an array ["hello", "world"]
          The each method is called on the created array
          The do/end block is called on each element labeled `word`
  Line 8: Calls the reverse! method on the passed in word
            The reverse method is a mutating method that changes the array that each was passed in to ['olleh', 'dlrow']
  Line 9: calls the join method on the array that was passed into .each and takes a space string as an argument
            returns 'olleh dlrow'
  
  The returned string is a different object than the string passed in because the string got split into an array and then joined back together.
=end