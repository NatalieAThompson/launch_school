flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}

flintstones.each.with_index do | value, index |
  flintstones_hash[value] = index
end

p flintstones_hash

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
sum = 0

ages.each do |_, value|
  sum += value
end

p sum
p ages.values.sum

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select! do |key, value|
  value < 100
end

p ages

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.min

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.find_index { |word| word.match(/Be\w*/) }

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |word| word.slice(0, 3) }
p flintstones

statement = "The Flintstones Rock"
statment_hash = {}

statement.delete(' ').each_char do |cha|
  statment_hash[cha] = statement.count(cha)
end

p statment_hash

words = "the flintstones rock"

p words.split.map { |word| word.capitalize }.join(' ')

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|
  age = munsters[key].values[0]

  case age
  when (0..18)
    age_group = "kid"
  when (19..65)
    age_group = "adult"
  else
    age_group = "senior"
  end

  # if munsters[key].values[0] < 18
  #   age_group = "kid"
  # elsif munsters[key].values[0] > 65
  #   age_group = "senior"
  # else
  #   age_group = "adult"
  # end

  munsters[key]["age_group"] = age_group
end

p munsters