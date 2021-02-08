# You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end
# What is the result of executing the following code:

oracle = Oracle.new
oracle.predict_the_future #=> The instance method predict_the_future is called and prints "You will " concatenated with the 
# return value of the instance method choices array with `sample` invoked on it. `sample` picks a random element from the array.