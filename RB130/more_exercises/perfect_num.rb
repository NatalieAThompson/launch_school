# Perfect Number
# The Greek mathematician Nicomachus devised a classification scheme for natural numbers, identifying each as belonging uniquely to the categories of abundant, perfect, or deficient. A perfect number equals the sum of its positive divisors — the pairs of numbers whose product yields the target number, excluding the number itself. This sum is known as the Aliquot sum.

# Perfect: Sum of factors = number
# Abundant: Sum of factors > number
# Deficient: Sum of factors < number
# Examples:

# 6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 + 3.
# 28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
# Prime numbers 7, 13, etc are deficient by the Nicomachus classification.
# Write a program that can tell if a number is perfect, abundant or deficient.
# 1, 2, 4, 8 - 16 deficient
# Test suite:

=begin
input: integer
output: string
- Perfect - a number that equals the sum of its positive divisors
- Prime numbers are all deficient
- Don't include the number in the set of factors

examples
- Negitive numbers should raise an error
- prime number are all deficient
- 28 = 1 + 2 + 4 + 7 + 14 (perfect)
- 12 < 1 + 2 + 3 + 4 + 6 = 16 (adbundant)

Data Struc
- integers
- array
- require "prime"
- strings
- loop 
- StandardError

Algo
- Create a class method `classify` that takes an int
  - Guard clause for negitive numbers
  - Return 'deficient' if the number is prime
  - sum = loop (2...given_num) (reduce(1) |total, ele|)
    - if int % ele == 0
      - add the ele to total
    - else
      - return total
      
  - when sum is == to int return 'perfect'
  - when sum is less than int return 'deficient'
  - when sum is greater than int return 'abundant'
=end

require 'prime'

class PerfectNumber
  def self.classify(int)
    raise_error(int)
    check_if_prime(int)
    sum = calculate(int)
    compare(sum, int)
  end
      
  private
  def self.raise_error(int)
    raise StandardError if int.negative?
  end
  
  def self.check_if_prime(int)
    return 'deficient' if int.prime?
  end
      
  def self.compare(sum, int)
    case sum
    when int then 'perfect'
    when 0...int then 'deficient'
    else 'abundant'
    end
  end
      
  def self.calculate(int)
    (2...int).reduce(1) do |total, ele|
      int % ele == 0 ? total += ele : total
    end
  end
end
  
require 'minitest/autorun'
#require_relative 'perfect_numbers'

class PerfectNumberTest < Minitest::Test
  def test_initialize_perfect_number
    assert_raises StandardError do
      PerfectNumber.classify(-1)
    end
  end

  def test_classify_deficient
    assert_equal 'deficient', PerfectNumber.classify(13)
  end

  def test_classify_perfect
    assert_equal 'perfect', PerfectNumber.classify(28)
  end

  def test_classify_abundant
    assert_equal 'abundant', PerfectNumber.classify(12)
  end
end