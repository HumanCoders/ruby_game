require 'gosu'

module RubyGame
  class Game < Gosu::Window
    def initialize(player, ruby)
      super(640, 480, false)
      self.caption = "Ruby Game"
      @background_image = Gosu::Image.new(self, File.join(IMAGES_PATH, 'background.png'), true)
      @player = player
      @ruby = ruby
      [@player, @ruby].each {|object| object.init_image(self)}
      @player.init_limits(width, height, 15, 40)
    end

    def update
      @player.move_left if button_down? Gosu::Button::KbLeft
      @player.move_right if button_down? Gosu::Button::KbRight
      @player.move_up if button_down? Gosu::Button::KbUp
      @player.move_down if button_down? Gosu::Button::KbDown
    end

    def draw
      @background_image.draw(0, 0, 0)
      [@player, @ruby].each {|object| object.draw}
    end

    def start!
      @state = :run
      self.show
    end
  end
end