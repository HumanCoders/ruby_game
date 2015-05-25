require_relative '../lib/ruby_game'

player = RubyGame::Player.new(590, 420)
ruby = RubyGame::Ruby.new(65, 115)

game = RubyGame::Game.new(player, ruby)
game.start
