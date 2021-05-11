class Hand
  attr_reader :cards, :bet

  def inintialize
    @cards = []
    @bet = 0
  end

  def add_card(card)
    @cards << card
  end

  def value? 
    total_value = 0  
    number_of_aces = 0

    self.cards.each do |card|
      if card.rank == "Ace"
        number_of_aces += 1
      end
      total_value += card.value
    end

    counter = 0
    while value > 21 && counter < number_of_aces
      counter += 1
      total_value -= 10
    end
    return total_value
  end

  def clear
    @cards = []
  end

  private

  attr_writer :cards, :bet

end