advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!('important', 'urgent')

p advice

numbers = [1, 2, 3, 4, 5]
p numbers.delete_at(1)
p numbers

numbers = [1, 2, 3, 4, 5]
p numbers.delete(1)
p numbers

p (10..100).cover?(42)

famous_words = "seven years ago..."

puts "Four score and #{famous_words}"

"Four score and " << famous_words

p ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]].flatten!

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

p flintstones.assoc("Barney")
p flintstones.slice("Barney").shift
p flintstones
