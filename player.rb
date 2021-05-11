class Player
  attr_reader :actions
  attr_reader :name, :bank, :hand

  def initialize(name)
    @name = name && name.capitalize
    @bank = Bank.new
    @hand = Hand.new
  end

  def put_in_bank(sum)
    bank.put(sum)
  end

  def take_a(card)
    hand.add(card)
  end

  def points
    hand.value
  end

  def cards
    hand.cards
  end

  def show_cards
    "#{cards.map(&:rank).join(' ') }, points: #{points}"
  end

  def hand_clear
    hand.clear
  end
end