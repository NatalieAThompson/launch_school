def max_by(ar)
  return nil if ar.empty?
  
  max = -10000
  result = ar[0]
  
  ar.each do |ele|
    if yield(ele).ord > max.ord
      max = yield(ele)
      result = ele
    end
  end
  
  result
end


p max_by([1, 5, 3]) { |value| value + 2 } == 5 #=> return value is int
p max_by([1, 5, 3]) { |value| 9 - value } == 1 #=> return value is int
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1 #=> return value is char
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5] #=> return value is int
p max_by([-7]) { |value| value * 3 } == -7 #=> return value is int
p max_by([]) { |value| value + 5 } == nil 