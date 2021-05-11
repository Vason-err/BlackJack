class Game
  attr_reader :player, :dealer

  START_CASH = 100

  def initialize
    @dealer = Dealer.new("John")
    @dealer.put_in_bank(START_CASH)
  end

  def create_new_player(player_name)
    @player = User.new(player_name)
    player.put_in_bank(START_CASH)
    player
  end

  def create_new_round
    Round.new(dealer, player)
  end

  private

  attr_writer :player
end
    
