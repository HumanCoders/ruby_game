require 'gosu'

module RubyGame
  class Game < Gosu::Window
    def initialize
      super(640, 480, false)
      self.caption = "Ruby Game"
    end

    def update
    end

    def draw
    end

    def start!
      @state = :run
      self.show
    end
  end
end