# Word Count
# Write a program that given a phrase can count the occurrences of each word in that phrase.

# For example, if we count the words for the input "olly olly in come free", we should get:
  
  
# olly: 2
# in: 1
# come: 1
# free: 1

=begin
Examples
- case insenstive
- split on ( ,/n)
- remove weird characters - "":.'(but not quotes in words)!!&@$%^& (Anything that isn't a word character)


Algo
-Create a method `word_count` that has access to @words
- downcase the @words right away, in the initialize method
- split @words by either a space, comma or \n then remove any empty strings
- iterate through the array of words and transform them into clean words
    -remove any nonword characters before and after the word
- iterate through the cleaned words and tally up the count of each word 



map! {|item| block } → aryclick to toggle source
map! → Enumerator
Invokes the given block once for each element of self, replacing the element with the value returned by the block.

See also Enumerable#collect.

If no block is given, an Enumerator is returned instead.

a = [ "a", "b", "c", "d" ]
a.map! {|x| x + "!" }
a #=>  [ "a!", "b!", "c!", "d!" ]
a.collect!.with_index {|x, i| x[0...i] }
a #=>  ["", "b", "c!", "d!"]

=end

class Phrase
  def initialize(words)
    @words = words.downcase
  end
  
  def word_count
    array_of_words = @words.split(/[ ,\n]/)
    
    array_of_words.map! { |word| find(word) }
                  .select { |word| word != nil }
                  .tally
  end
  
  private
  def find(word)
    word.scan(/\b.+\b/)[0]
  end
end
  
  
require 'minitest/autorun'
## require_relative 'word_count'

# Test data version:

class PhraseTest < Minitest::Test
  def test_count_one_word
    phrase = Phrase.new('word')
    counts = { 'word' => 1 }
    assert_equal counts, phrase.word_count
  end

  def test_count_one_of_each
    phrase = Phrase.new('one of each')
    counts = { 'one' => 1, 'of' => 1, 'each' => 1 }
    assert_equal counts, phrase.word_count
  end

  def test_count_multiple_occurrences
    phrase = Phrase.new('one fish two fish red fish blue fish')
    counts = { 'one' => 1, 'fish' => 4, 'two' => 1, 'red' => 1, 'blue' => 1 }
    assert_equal counts, phrase.word_count
  end

  def test_count_everything_just_once
    phrase = Phrase.new('all the kings horses and all the kings men')
    phrase.word_count # count it an extra time
    counts = {
      'all' => 2, 'the' => 2, 'kings' => 2,
      'horses' => 1, 'and' => 1, 'men' => 1
    }
    assert_equal counts, phrase.word_count
  end

  def test_ignore_punctuation
    phrase = Phrase.new('car : carpet as java : javascript!!&@$%^&')
    counts = {
      'car' => 1, 'carpet' => 1, 'as' => 1,
      'java' => 1, 'javascript' => 1
    }
    assert_equal counts, phrase.word_count
  end

  def test_handles_cramped_lists
    phrase = Phrase.new('one,two,three')
    counts = { 'one' => 1, 'two' => 1, 'three' => 1 }
    assert_equal counts, phrase.word_count
  end

  def test_handles_expanded_lists
    phrase = Phrase.new("one,\ntwo,\nthree")
    counts = { 'one' => 1, 'two' => 1, 'three' => 1 }
    assert_equal counts, phrase.word_count
  end

  def test_include_numbers
    phrase = Phrase.new('testing, 1, 2 testing')
    counts = { 'testing' => 2, '1' => 1, '2' => 1 }
    assert_equal counts, phrase.word_count
  end

  def test_normalize_case
    phrase = Phrase.new('go Go GO')
    counts = { 'go' => 3 }
    assert_equal counts, phrase.word_count
  end


  def test_with_apostrophes
    phrase = Phrase.new("First: don't laugh. Then: don't cry.")
    counts = {
      'first' => 1, "don't" => 2, 'laugh' => 1,
      'then' => 1, 'cry' => 1
    }
    assert_equal counts, phrase.word_count
  end

  def test_with_quotations
    phrase = Phrase.new("Joe can't tell between 'large' and large.")
    counts = {
      'joe' => 1, "can't" => 1, 'tell' => 1,
      'between' => 1, 'large' => 2, 'and' => 1
    }
    assert_equal counts, phrase.word_count
  end
end