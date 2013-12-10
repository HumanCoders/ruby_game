require_relative '../lib/ruby_game'

game = RubyGame::Game.new
game.start! do |g|
  g.player RubyGame::Player.new(590, 420)
  g.ruby RubyGame::RubyObject.new(65, 115)
  g.monster RubyGame::Monster.new
end