class Card
  include Comparable
  
  attr_reader :rank, :suit
  
  VALUES = {'Ace' => 14,
            'King' => 13,
            'Queen' => 12,
            'Jack' => 11 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  
  def <=>(object)
    determine_value <=> object.determine_value
  end
  
  def determine_value
    case rank
    when Integer
      rank
    when String
      VALUES[rank]
    end
  end
  
  def to_s
    "#{suit} of #{rank}"
  end
end