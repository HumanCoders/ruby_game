require 'gosu'

module RubyGame
  class Game < Gosu::Window
    def initialize
      super(640, 480, false)
      self.caption = "Ruby Game"
      @background_image = Gosu::Image.new(self, File.join(IMAGES_PATH, 'background.png'), true)
    end

    def update
      @player.move_left if button_down?(Gosu::Button::KbLeft)
      @player.move_right if button_down?(Gosu::Button::KbRight)
      @player.move_up if button_down?(Gosu::Button::KbUp)
      @player.move_down if button_down?(Gosu::Button::KbDown)
    end

    def draw
      @background_image.draw(0, 0, 0)
      [@player, @ruby].each {|object| object.draw}
    end

    def start
      yield(self)
      self.show
    end

    def player(x, y)
      @player = Player.new(x, y)
      @player.init_image(self)
    end

    def ruby(x, y)
      @ruby = Ruby.new(x, y)
      @ruby.init_image(self)
    end
  end
end
