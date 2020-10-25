arr = ['10', '11', '9', '7', '8']

arr.sort! do |a, b|
  b.to_i <=> a.to_i
end

p arr

#---------------------------------------

#How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

p books.sort_by { |hsh| hsh[:published] }

#--------------------------------------
#For each of these collection objects demonstrate how you would reference the letter 'g'

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
p arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
p arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
p arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
p hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
p hsh2[:third].keys[0]

#---------------------------------------
#For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4

#--------------------------------------
#figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

new_hsh = munsters.select do |key, _|
  munsters[key]['gender'] == 'male'
end

sum = 0

new_hsh.each do |key, value|
  sum += new_hsh[key]['age']
end

p sum

#----------------------------------------
# One of the most frequently used real-world string properties is that of "string substitution", 
# where we take a hard-coded string and modify it with various parameters from our program.
# Given this previously seen family hash, print out the name, age and gender of each family member:
#(Name) is a (age)-year-old (male or female).

munsters.each do |key, value|
  p sprintf("%s is a %i-year-old %s", key, value['age'], value['gender'])
end

#---------------------------------------
#Given this code, what would be the final values of a and b? Try to work this out without running the code.

a = 2                       #memory 10
b = [5, 8]                  #b is mem 1, b[0] is mem 11, b[1] is mem 12
arr = [a, b] #[2, [5, 8]]   arr[0] is mem 10, arr[1] is mem 1, arr[1][0] is mem 11, arr[1][1] is mem 12

arr[0] += 2  #[4, [5, 8]]   arr[0] is now mem 20 (changes memeory slots because of assignment)
arr[1][0] -= a #[4, [3, 8]] arr[1][0] is now mem 21, arr[1] is still mem 1 so b would be [3, 8]

#a would be 2
#b would be [3, 8]
p a
p b

#--------------------------------------
#Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, value|
  value.each do |word|
    word.each_char do |char|
      if "aeiou".include?(char)
        p char
      end
    end
  end
end

#-------------------------------------
# Given this data structure, return a new array of the same structure 
# but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr2 = arr.map do |sub_ar|
  sub_ar.sort do |a, b|
    b <=> a
  end
end

p arr2

#------------------------------------
# Given the following data structure and without modifying the original array, 
# use the map method to return a new array identical in structure to the original 
# but where the value of each integer is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr2 = arr.map do |hsh|
  inner_ar = hsh.map do |key, value|
    [ key, value + 1 ]
  end
  inner_ar.to_h
end

p arr2
p arr

#-----------------------------------
# Given the following data structure use a combination of methods, including either the select or reject method, 
# to return a new array identical in structure to the original but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr2 = arr.map do |sub_ar|
  sub_ar.select { |num| num % 3 == 0 }
end

p arr2
p arr

#-----------------------------------
# Given the following data structure, and without using the Array#to_h method, 
# write some code that will return a hash where the key is the first item in each sub array and the value is the second item.
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hsh = {}
 
arr.each do |sub_ar|
  hsh[sub_ar[0]] = sub_ar[1]
end

p hsh
p arr

#-----------------------------------
# Given the following data structure, return a new array containing the same sub-arrays as the original 
# but ordered logically by only taking into consideration the odd numbers they contain.
#[[1, 8, 3], [1, 6, 7], [1, 4, 9]]

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# arr2 = arr.sort do |sub_a, sub_b|
#   sub_a[-1] <=> sub_b[-1]
# end
#My cheesy answer above

arr2 = arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end

p arr2

#-----------------------------------
# Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. 
# The sizes should be uppercase and the colors should be capitalized.
#[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

ar = hsh.map do |key, value|
  if value[:type] == 'fruit'
    value[:colors].map { |color| color.capitalize }
  else
    value[:size].upcase
  end
end

p ar

#------------------------------------
#Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr2 = arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end

p arr2



