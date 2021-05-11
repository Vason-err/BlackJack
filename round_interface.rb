class RoundInterface

  attr_reader :round

  def initialize(round)
    @round = round
  end

  def start
    start_new_round
    steps
    open_cards
    result
    prize
  end

  def start_new_round
    puts 'New round!!!'
    puts "Player.cards: #{player.show_cards}"
    puts "Dealer cards: * *"
  end

  def steps
    break unless player_steps
    diler_steps
  end

  def open_cards
    puts "Players show their cards"
    puts "Player cards: #{player.show_cards}"
    puts "Dealer cards: #{dealer.show_cards}"
  end

  def results
    puts "Round results:"
    winner = round.winner
    puts "Winner #{winner.name}"
  end

  def prize
    round.prize
    puts "Bank: #{player.bank.sum}"
  end

  def next_round?
    puts 'Want to play next round?'
    gets.chomp.casecmp("y").zero?
  end

  private

  def diler
    round.diler
  end

  def player
    round.player
  end

  def deck
    round.deck
  end

  def player_steps
    puts "Player steps:"
    puts "#{player.show_actions}"
    case gets.chomp
    when "add"
      player.actions.delete("add")
      player.card(deck.card)
      puts "Player cards: #{player.show_cards}"
      true
    when "open"
      open
      false
    when "pass"
      player.actions.delete("pass")
      true
    end
  end

  def diler_step
    puts "Diler step"
    diler.card(deck.card) if diler.points < diler.max.points
  end
end