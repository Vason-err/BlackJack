class Hand
  attr_reader :cards

  MIN_BET = 10
  def inintialize
    @cards = []
  end

  def add(card)
    @cards << card
  end

  def bet!
    MIN_BET
  end

  def value
    total_value = 0  
    number_of_aces = self.cards.count { |card| card.rank == "Ace"}
    self.cards.each do |card|
      total_value += card.value
    end
    number_of_aces.times do
      if total_value > 21
        total_value -= 10
      end
    end
    return total_value
  end

  def clear
    @cards = []
  end

  private

  attr_writer :cards

end