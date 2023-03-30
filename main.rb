require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'bank'
require_relative 'player'
require_relative 'user'
require_relative 'dealer'
require_relative 'round'
require_relative 'game'
require_relative 'round_interface'
require_relative 'game_interface'

GameInterface.new(Game.new).start_new_game