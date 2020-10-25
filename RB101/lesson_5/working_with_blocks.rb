[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]

=begin
The method .map is being called on a multidimensional array.
Inside the block Arr represents an array element
The puts method is printing out the string version of the numbers in the 0 index of each array passed in by calling the first method on arr
puts returns nill. The map method does use the return value to transform the passed in value to a new value.
.map returns [nil, nil] and side effect prints 1 and 3.
=end

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

=begin
Line 16:  .map which is called on the outer array. 
          The return value of map is the returned element from the block [1, 3]
          The return value is not used.
Lines 16 - 19: do/end block that uses the sub arrays.
          The return value is the return value of .first because it is on the last line of the block
          The return value is used to determine the map transformation.
Line 17:  puts is called on index 0 of each sub array. 
          Side effect of printing the string version of the integer called on.
          The return value of puts is nil
          The return value isn't used.
Line 18 & 19: .first called on the sub array.
          The return value of first is the element at the 0 index of the sub array.
          The return value is used by puts and the block

1
3
=> [1, 3]
=end

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

=begin
Line 41: 
        Initalized a multidimensional array `my_arr`
          The return value is [[18, 7], [3, 12]]
        .each is called on `my_arr`
          Doesn't have a side affect
          The return value of .each is the passed in multidiminsional array
          The return value is used by `my_arr` for initalization.
Lines 41 - 47 
        do/end block that uses sub arrays named  `arr`
          Doesn't have a side affect
          The return value of block is the sub array values passed into .each
          The return value isn't used.
Line 42 
        .each is called on the sub array (`arr`)
          Doesn't have a side affect
          The return value of .each is the sub array passed in
          Yes to determine the return value of the outer do/end block.
Lines 42 - 46
        do/end block that uses the integers in the sub arrays calling them `num`
          Doesn't have a side affect
          The return value is nil
          The return value isn't used
Lines 43 - 45
        a compairson (>) uses `num` element
          Doesn't have a side affect
          returns a boolean
          The return value is used by the if statement
        a conditional (if) that uses `num` element
          Doesn't have a side affect
          The return value is nil
          The return value is used to determind the value of the do/end block
Line 44
        puts method called on `num`
          The side affect is printing a string based on the number.
          The return value is nil
          The return value is used to determine the return value of the if statement.

18
7
12
=> [[18, 7], [3, 12]]
=end

[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

=begin
line 93: 
      .map
        Acts on the multidiminsional array
        Doesn't have a side effect
        The return value a new array with the return values passed by the block [[2, 4], [6, 12]]
        The return value is not used.
line 93 - 97
      do/end block
        Acts on the sub array values
        Doesn't have a side effect
        The return value is the value determinded by the inner .map (a new transformed array)
        The return value is used to pass to the outer .map method
line 94
      .map
        Acts on the sub array values
        Doesn't have a side effect
        The return value is determined by the block (a new transformed array)
        The return value should return new sub arrays for the outer block ([2, 4], [6, 12])
line 94 - 96
      do/end block
        Acts on the digits in sub array
        Doesn't have a side effect
        The return value is the num element multiplied by 2 (2, 4, 6, 12) (an integer)
        The return value is used by .map for transformation
line 95
      Method call ( * ) with integer 2 as an argument
        Acts on the elements in the sub array
        Doesn't have a side effects
        The return value is an integer
        The return value is used to determine return value of do/end block.
        
=>[[2, 4], [6, 12]]
=end

[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]

=begin
line 134:
      .select
        Used on an array of hashs
        Doesn't have a side effect
        The return value is a new array
          => [{ :c => "cat" }]
        The return value is not used
line 134 - 138
      do/end block
        each sub hash
        Doesn't have a side effect
        The return value is based on the .all call (a boolean)
          => false, true
        The return value is used by the select method
line 135 
      .all?
        each sub hash
        doesn't have a side effect
        The return value is a boolean
          => false, true
        The return value is used by the do/end block above it
line 135 - 137
      do/end block
        each key value pair in the hash
        doesn't have a side effect
        The return value is a boolean
          => true, false, true
        The return value is used by the all method.
line 136
      compairison (==)
        uses the key value pairs
        doesn't have a side effect
        The return value is a boolean
          =>true, false, true
        The return value is used by the do/end block
=end

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]

=begin
line 179
      .sort_by
        is use on a multidimensional array
        Doesn't have a side affect
        Returns a sorted multidimensional array
        The return value is not used.
line 179 - 183
      do/end block
        is used on sub array
        Doesn't have a side effect
        The return value is the sub array ints
        The .sort_by method uses the returned value for sorting
line 180
      .map
        is used on sub array
        Doesn't have a side effect
        The return value are new sub arrays
        The return value is used by the do/end block
line 180 - 182
      do/end block
        is used on the element
        Doesn't have a side effect
        The return value is an integer
        .map uses the return value for transformation.
line 181
      .to_i
        is used on the element
        Doesn't have a side effect
        The return value is an integer
        The do/end block uses the return value
=end

[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
# => [[27], ["apple"]]

=begin
line 219
      .map
        used on a multidimensional array
        doesn't have a side effect
        The return value is a new multidimensional array
        Nothing uses the return value.
line 219 -227
      do/end block
        used on the sub arrays
        doesn't have a side effect
        The return value is a new array created by select
        The return value is used by map
line 220 
      .select
        used on the sub arrays
        doesn't have a side effect
        The return value is a new array of elements that were true to conditions
        The return value is used as the return value of the do/end block
line 220 - 226
      do/end block
        uses the element
        there is no side effect
        the return value is booleans from the if statement
        The select method does use the return values.
line 221
      conditional (if)
        uses the element
        There is no side effect
        The return values will be booleans
        The do/end block uses the return values
      compairison == passed in the element
        used on the element converted to a string and then to an int to see if it is a number
        There is no side effect
        The return value is a boolean
        The return value is used to see what part of the if statment runs
line 222
      > method that passes in 13
        called on the element
        Doesn't have a side effect
        The return value is a boolean
        The return value is used by the if statement
line 224
      < method that passes in 6
        called on the length of element
        Doesn't have a side effect
        The return value is a boolean
        The return value is used by the if statement
=end

[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]

=begin
line 280
      .map
        used on a multidiminsional array
        has no side effects
        The return value is a transformed array of the same values sent back by .each
        Nothing uses the return value.
line 280 - 286
      do/end block
        used on the top sub array
        has no side effects
        The return value is the value from each
        .map does use the return value
line 281 
      .each
        Called on the top sub array
        has no side effects
        The return value of .each is what is passed in
        The do/end block does use the return value
line 281 - 285
      do/end block
        used on element2 object
        has no side effects 
        The return value is the value from select
        Nothing uses this return value
line 282
      .partition
        used on the element2 object
        has no side effects
        The return value is two arrays that match true and false values
        The do/end block uses the the return value
line 282 - 284
      do/end block
        uses on the element
        has no side effects
        The return value is a boolean
        The .partition method does use the return value
line 283
      > method passing in 0
        acts on the size of the passed in element
        has no side effects
        The return value is a boolean
        The do/end block uses the return value
=end

[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

=begin
line 334
      .map
        used on the multidimensional array
        doesn't have a side effect
        The return value is a transformed multidimensional array [[[2, 3], [4, 5]], [6, 7]]
        Nothing uses the return value
line 334 - 344
      do/end block
        used on the sub arrays [[1, 2], [3, 4]], [5, 6]
        doesn't have a side effect
        The return values are the values from the inner .map [[2, 3], [4, 5]], [6, 7]
        The outer .map uses this value for transformation
line 335 
      .map
        used on the sub arrays [[1, 2], [3, 4]], [5, 6]
        doesn't have a side effect
        The return values are transformed arrays [[2, 3], [4, 5]], [6, 7]
        The upper do/end block uses the return values
line 335 - 343
      do/end block
        uses el object [1, 2], [3, 4], 5, 6
        doesn't have a side effect
        The return values are int or array values [2, 3], [4, 5], 6, 7
        .map does use the return values
line 336 - 342
      conditional (if)
        uses the elements size
        doesn't have a side effect
        returns int or array values [2, 3], [4, 5], 6, 7
        The do/end block does use the return values
line 336
      compairson == passing in 1
        acts on the el elements [1, 2], [3, 4], 5, 6
        doesn't have a side effect
        returns true or false depending if the el is an int or array false, false, true, true
        The if statement uses the return value to see where the element runs
line 337
      + method passing in 1
        acts on the el element that meets the condition 5, 6
        doesn't have a side effect
        returns the an int 6, 7
        the if statement uses this return value
line 339
      .map
        acts on the el element [1, 2], [3, 4]
        doesn't have a side effect
        The return value are transformed arrays using the blocks return value [2, 3], [4, 5]
        The if statement uses this return value
line 339 - 341
      do/end block
        acts on the n element 1, 2, 3, 4
        doesn't have a side effect
        The return value is an int 2, 3, 4, 5
        .map does use the return value
line 340
      + method passing in 1
        acts on the n element 1, 2, 3, 4
        doesn't have a side effect
        The return value is an int 2, 3, 4, 5
        The do/end block uses the return value

=> [[[2, 3], [4, 5]], [6, 7]]
=end