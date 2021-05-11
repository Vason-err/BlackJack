class Game
  attr_accessor :player, :dealer

  START_CASH = 100

  def initialize
    @dealer = Diler.new("John")
    @diler.put_in_bank(START_CASH)
  end

  def create_new_player(name)
    @player = PLayer.new(player_name)
    player.put_in_bank(START_CASH)
    player
  end

  def create_new_round
    Round.new(diler, player)
  end

  private

  attr_writer :player
end
    
