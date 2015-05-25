require 'gosu'

module RubyGame
  class Game < Gosu::Window
    def initialize
      super(640, 480, false)
      self.caption = "Ruby Game"
    end

    def start
      self.show
    end
  end
end

game = RubyGame::Game.new
game.start
