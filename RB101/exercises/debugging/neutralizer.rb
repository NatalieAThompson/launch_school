def neutralize(sentence)
  words = sentence.split(' ')
  new_words = []

  words.each do |word|
    new_words << word if !negative?(word)
  end

  new_words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.