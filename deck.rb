
class Deck
  attr_accessor :cards, :bank

  def initialize
    self.cards = []
    (0..51).each { |i| cards << Card.new(i) }
    self.cards.shuffle!
    @bank = Bank.new
  end

  def draw
    self.cards.pop
  end

  def cards?
    !self.cards.empty?
  end

  def take_bets(sum)
    bank.put(sum)
  end
end