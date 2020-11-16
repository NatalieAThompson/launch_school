# Let's build another program using madlibs. We made a program like this in the easy exercises. 
# This time, the requirements are a bit different.

# Make a madlibs program that reads in some text from a text file that you have created, 
# and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it. 
# You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, 
# but the text data should come from a file or other external source. Your program should read this text, and for each line, 
# it should place random words of the appropriate types into the text, and print the result.

# The challenge of this program isn't about writing your program; it's about choosing how to represent your data. 
# Choose the right way to structure your data, and this problem becomes a whole lot easier. 
# This is why we don't show you what the input data looks like; the input representation is your responsibility.

# The sleepy brown cat noisily
# licks the sleepy yellow
# dog, who lazily licks his
# tail and looks around.

# The %{adjective} brown %{noun} %{adverb}
# %{verb} the %{adjective} yellow
# %{noun}, who %{adverb} %{verb} his
# %{noun} and looks around.
# Example replacement words

# adjectives: quick lazy sleepy ugly
# nouns: fox dog head leg
# verbs: jumps lifts bites licks
# adverb: easily lazily noisily excitedly

=begin
input:
output:
-read in text from a txt file
-The file plugs in random verbs, adjectives, nouns to the text file and prints it
-build your lists of nouns, verbs, adjectives, and adverbs directly

=end

text = File.open('madlib.txt')

Replacements = {
  adjective: %w(quick lazy sleepy ugly),
  noun: %w(fox dog head leg),
  verb: %w(jumps lifts bites licks),
  adverb: %w(easily lazily noisily exccitedly)
}

ENDINGS = %w(! . ,)

#p text.each_line.each { |line| p line}

text.each_line do |line|
  line.split.each do |word|
    modified_word = word
    ENDINGS.each { |s| modified_word = modified_word.delete(s) }
    punctuation = word.delete(modified_word)

    if Replacements.keys.include?(modified_word.to_sym)
      print Replacements[modified_word.to_sym].sample + punctuation + ' '
    else
      print word + ' '
    end
  end
end


