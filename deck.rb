require_relative 'card'
class Deck
  attr_accessor :cards

  def initialize
    self.cards = []
    (0..51).each { |i| cards << Card.new(i) }
    self.cards.shuffle! 
  end

  def draw
    self.cards.pop
  end

  def cards?
    !self.cards.empty?
  end
end