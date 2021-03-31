def all?(ar)
  new_ar = ar.select { |ele| yield(ele) }

  new_ar.size == ar.size
end

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true

=begin
  iterate through the collection and return a new array of only objects that return true
  yield to block and pass in a value
  compare the new array with ar
    if they are the same length return true
    if they are different lengths return false

=end