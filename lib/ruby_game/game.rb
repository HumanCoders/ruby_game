require 'gosu'

module RubyGame
  class Game < Gosu::Window
    def initialize(width, height, player, ruby)
      super(width, height, false)
      self.caption = "Ruby Game"
      @player, @ruby = player, ruby
      @player.init_limits(width, height, 15, 40)
      @objects = [player, ruby]
      @objects.each {|object| object.init_image(self)}
      @background_image = Gosu::Image.new(self, File.join(RubyGame::IMAGES_PATH, 'background.png'), true)
    end

    def update
      @player.move_left if button_down? Gosu::Button::KbLeft
      @player.move_right if button_down? Gosu::Button::KbRight
      @player.move_up if button_down? Gosu::Button::KbUp
      @player.move_down if button_down? Gosu::Button::KbDown
    end

    def draw
      @background_image.draw(0, 0, 0)
      @objects.each {|object| object.draw}
    end

    def start!
      self.show
      @state = :run
    end
  end
end