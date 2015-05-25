require 'gosu'

module RubyGame
  class Game < Gosu::Window
    def initialize
      super(640, 480, false)
      self.caption = "Ruby Game"
      @background_image = Gosu::Image.new(self, File.join(IMAGES_PATH, 'background.png'), true)
      @player = Player.new(self, 590, 420)
    end

    def draw
      @background_image.draw(0, 0, 0)
      @player.draw
    end

    def start
      self.show
    end
  end
end
