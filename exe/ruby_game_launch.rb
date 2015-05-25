require_relative '../lib/ruby_game'

game = RubyGame::Game.new
game.start do |g|
  g.player 590, 420
  g.ruby 65, 115
end
