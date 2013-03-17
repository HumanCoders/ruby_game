require 'gosu'

module RubyGame
  class Game < Gosu::Window
    def initialize(width, height)
      super(width, height, false)
      self.caption = "Ruby Game"
      @background_image = Gosu::Image.new(self, File.join(RubyGame::IMAGES_PATH, 'background.png'), true)
    end

    def update
    end

    def draw
      @background_image.draw(0, 0, 0)
    end

    def start!
      self.show
      @state = :run
    end
  end
end