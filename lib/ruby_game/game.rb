require 'gosu'

module RubyGame
  class Game < Gosu::Window
    def initialize(width, height)
      super(width, height, false)
      self.caption = "Ruby Game"
    end

    def update
    end

    def draw
    end

    def start!
      self.show
      @state = :run
    end
  end
end