class Round
  MAX_POINT = 21
  attr_reader :dealer, :player, :bank, :deck

  def initialize(dealer, player)
    @dealer = dealer
    @dealer.hand_clear
    @player = player
    @player.init_actions
    @player.hand_clear
    @deck = Deck.new
  end

  def init
    2.times { player.take_a(deck.draw) }
    2.times { dealer.take_a(deck.draw) }
    deck.take_bets(player.make_a_bet + dealer.make_a_bet)
  end

  def winner_is?
    return false if dealer.points == player.points || (dealer.points > MAX_POINT && player.points > MAX_POINT)
    return dealer if player.points > MAX_POINT
    return player if dealer.points > MAX_POINT
    player.points > dealer.points ? player : dealer
  end

  def prize
    prize_sum = deck.bank.take(deck.bank.total_sum)
    return winner_is?.put_in_bank(prize_sum) if winner_is?
    half_sum = prize_sum/2
    dealer.put_in_bank(half_sum)
    player.put_in_bank(half_sum)
  end
end