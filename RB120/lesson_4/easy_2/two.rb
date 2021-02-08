# We have an Oracle class and a RoadTrip class that inherits from the Oracle class.
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end
# What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future
#=> The instance method predict_the_future is called. The method lookup path dictates that we look inside RoadTrip and when 
# the instance method isn't found we look for it in the superclass Oracle. Since Oracle does contain the instance method we stop 
# looking for it and use the one we found. On line 4 The string object "You will " is concatenated with the return value of the 
# instance method choices. The method lookup path starts at the same location inside RoadTrip so the array 
# ["visit Vegas", "fly to Fiji", "romp in Rome"] is returned and .sample is invoke on that picking a random element.