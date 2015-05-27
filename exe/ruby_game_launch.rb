require_relative '../lib/ruby_game'

RubyGame::Monster.define :ghost1 do |m|
  m.image_name "ghost1"
  m.speed 2
  m.action :move_up, speed: 4, repeat: 40
  m.action :move_down, repeat: 80
end

game = RubyGame::Game.new
game.start! do |g|
  g.player 590, 420
  g.ruby 65, 115
  g.monsters type: :ghost1, number: 3
end
