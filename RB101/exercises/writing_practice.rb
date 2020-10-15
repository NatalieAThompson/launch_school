def oddities(array)
  odd_elements = []
  index = 0
  while index < array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements
end

`line 1` defines a new method that takes in an array
`line 2` a new variable `odd_elements` is initalized to an empty array
`line 3` a local variable of `index` is initalized to `0`
`line 4` starts a while loop that continues looping till the 
         `index` is equal to or greater than the length of the passed
         in array
`line 5` shovels elements from the passed in array to `odd_elements`
`line 6` increments `index` by `2` so that only even index get 
         shoveled into the `odd_elements` array
After the loop finishes because `index` is equal or greater than 
the passed in arrays length
`line 7` returns the `odd_elements` arrays

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

`line 24` defines a method `real_palindrome?` that takes in a 
string variable
`line 25` is reassigning the inputed variable `string`
          First it is calling the  `.downcase` method to string
          which lowercases the characters
          Then `.delete` is called which is passed in a string 
          The string starts with `^` that tells `.delete` to delete
          anything that is not what what follows.
          Which in this case is a letter from a to z or a number 0 to 9
`line 26` calls another method that takes in the `string` variable 
          The return of the `palindrome?` method is then returned from
          the current method `real_palindrome?`


def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

`line 43` defines a method that takes in a variable named `year`
`line 44` initalizes the variable `century` to an int
`line 45` reassigns `century` to subtract 1 from itself if a condition is method
          The condition useds the modulo operator to see if `century` divided by 100 has a remainder
`line 46` uses the `.to_s` method to convert century from an int to a string
          Then concatenates it with another string created from the `century_suffix` method which
          takes `century` as an argument
`line 49` defines the `century_suffix` method that takes in a variable labeled century
`line 50` returns a string 'th' if a condition is method
          The condition uses the `include` method which is passed in an argument to compaire to the array `[11, 12, 13]`
          The argument is the remainder of the `century` variable divided by `100` using the modulo operator
`line 51` initalizes a new variable `last_digit` 
`line 53` creates a case statement that compares the value of `last digit`
          `1` returns 'st'
          `2` returns `nd`
          `3` returns `rd`
          Anything else returns `th`

def multiple?(number, divisor)
  number % divisor == 0
end

def multisum(max_value)
  sum = 0
  1.upto(max_value) do |number|
    if multiple?(number, 3) || multiple?(number, 5)
      sum += number
    end
  end
  sum
end

`line 79` defines a method which takes in two integars and returns a bool
`line 80` tests a true/false statement and returns the value
`line 83` defines a method which takes in an int and returns and int on `line 90`
`line 84` initalizes `sum` to `0`
`line 85` uses the `upto` method to loop through `1` to `max_value` passing in each number
          `line 86` tests if `number` can be evenly divided by 3 or 5
          if that statement is true it adds `number` to `sum`