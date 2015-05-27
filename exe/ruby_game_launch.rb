require_relative '../lib/ruby_game'

RubyGame::Monster.define :ghost1 do
  image_name "ghost1"
  action :move_up, speed: 4, repeat: 40
  action :move_down, repeat: 80
end

RubyGame::Monster.define :ghost2 do
  image_name "ghost2"
  action :move_left, speed: 1, repeat: 160
  action :move_right, speed: 4, repeat: 40
end

RubyGame::Monster.define :ghost3 do
  image_name "ghost3"
  speed 1
  action :move_up, repeat: 80
  action :move_left, repeat: 80
  action :move_down, repeat: 80
  action :move_right, repeat: 80
end

RubyGame::Monster.define :dark_knight do
  image_name "dark_knight"
  action :follow, speed: 1
end

game = RubyGame::Game.new
game.start! do
  player 590, 420
  ruby 65, 115
  monsters type: :ghost1, number: 2
  monsters type: :ghost2, number: 2
  monsters type: :ghost3
  monsters type: :dark_knight
end
