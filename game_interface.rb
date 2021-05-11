class GameInterface
  attr_reader :game

  def initialize(game)
    @game = game
  end

  def start_new_game
    puts 'Welcome to Black Jack!'
    puts "Hello) My name is #{dealer.name}. Want to play?"
    create_new_player
    loop do
      round_interface = RoundInterface.new(create_round)
      round_interface.start_new_round
      break unless round_interface.next_round?
    end
    puts "Thanks for playing, #{player.name}, great game!"
  end

  def create_new_player
    puts 'What is your name?'
    player_name = gets.chomp
    game.create_new_player(player_name)
  end

  def create_round
    game.create_new_round
  end

  private

  def dealer
    game.dealer
  end

  def player
    game.player
  end
end