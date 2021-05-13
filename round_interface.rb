class RoundInterface

  attr_reader :round

  def initialize(round)
    @round = round
  end

  def start
    start_new_round
    steps
    results
    prize
  end

  def start_new_round
    puts "New round #{player.name}!!!"
    round.init
    puts "Bets are made!"
    puts "Player.cards: #{show_cards(player)}"
    puts "Dealer cards: * *"
  end

  def steps
    loop do
      break unless player_steps
      dealer_steps
    end
  end

  def open_cards
    puts "Players show their cards"
    puts "Player cards: #{show_cards(player)}"
    puts "Dealer cards: #{show_cards(dealer)}"
  end

  def results
    puts "Round results:"
    if round.winner_is?
      winner = round.winner_is?
      puts "Winner #{winner.name}!!!"
    else
      puts "Draw!"
    end
  end

  def prize
    round.prize
    puts "Bank: #{player.bank.total_sum}"
  end

  def next_round?
    puts 'Want to play next round?'
    gets.chomp.casecmp("y").zero?
  end

  private

  def dealer
    round.dealer
  end

  def player
    round.player
  end

  def deck
    round.deck
  end

  def player_steps
    puts "Player steps:"
    puts "Actions: #{player.show_actions}"
    case gets.chomp
    when "add"
      player.actions.delete("add")
      player.take_a(deck.draw)
      puts "Player cards: #{show_cards(player)}"
      true
    when "open"
      open_cards
      false
    when "pass"
      player.actions.delete("pass")
      true
    end
  end

  def dealer_steps
    puts "Dealer steps:"
    if dealer.can_take?
      puts "Add"
      dealer.take_a(deck.draw)
    else
      puts "Pass"
    end
  end

  def show_cards(player)
    "#{player.cards.map { |card| to_string(card) }.join(', ')}, points: #{player.points}"
  end

  def to_string(card)
    card.rank + " of " + card.suit
  end
end