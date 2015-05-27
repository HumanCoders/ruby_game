require_relative '../lib/ruby_game'

RubyGame::Monster.define :ghost1 do
  image_name "ghost1"
  speed 2
  action :move_up, speed: 4, repeat: 40
  action :move_down, repeat: 80
end

game = RubyGame::Game.new
game.start! do
  player 590, 420
  ruby 65, 115
  monsters type: :ghost1, number: 3
end
