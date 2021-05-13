class Card

  SUITS = %w(Hearts Diamonds Clubs Spades)
  RANKS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  attr_accessor :suit, :rank

  def initialize(num) #card id is the number between 0 and 51
    @rank = RANKS[num % 13]
    @suit = SUITS[num % 4]
  end

  def value
    case rank
    when rank.to_i.to_s then rank.to_i
    when 'Jack', 'Queen', 'King' then 10
    else 11
    end
  end
end