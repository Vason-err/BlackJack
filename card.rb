class Card

  SUITS = %w(Hearts Diamonds Clubs Spades)
  RANKS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  attr_accessor :suit, :value, :rank

  def initialize(num) #card id is the number between 1 and 52
    card_index = num % 13
    @rank = RANKS[card_index]
    @suit = SUITS[num % 4]
    @value = 
    case card_index
    when 0..8 then card_index + 2
    when 9..11 then 10
    else 11
    end
  end

  def to_string
    self.rank + " of " + self.suit
  end
end