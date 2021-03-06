require 'gosu'
require_relative "ruby_game/movable"
require_relative "ruby_game/static_object"
require_relative "ruby_game/ruby"
require_relative "ruby_game/player"
require_relative "ruby_game/monster"
require_relative "ruby_game/game"

module RubyGame
  ROOT_PATH = File.expand_path('../', File.dirname(__FILE__))
  IMAGES_PATH = File.join(ROOT_PATH, '/images')
end
