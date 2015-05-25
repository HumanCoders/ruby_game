require 'gosu'

module RubyGame
  class Game < Gosu::Window
    def initialize
      super(640, 480, false)
      self.caption = "Ruby Game"
      @background_image = Gosu::Image.new(self, File.join(IMAGES_PATH, 'background.png'), true)
      @player_image = Gosu::Image.new(self, File.join(IMAGES_PATH, 'player.png'), true)
    end

    def draw
      @background_image.draw(0, 0, 0)
      @player_image.draw(560, 400, 0)
    end

    def start
      self.show
    end
  end
end
