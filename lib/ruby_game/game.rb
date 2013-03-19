require 'gosu'

module RubyGame
  class Game < Gosu::Window
    def initialize
      super(640, 480, false)
      self.caption = "Ruby Game"
      @background_image = Gosu::Image.new(self, File.join(IMAGES_PATH, 'background.png'), true)
      @font = Gosu::Font.new(self, Gosu::default_font_name, 60)
    end

    def update
      if self.run?
        @player.move_left if button_down? Gosu::Button::KbLeft
        @player.move_right if button_down? Gosu::Button::KbRight
        @player.move_up if button_down? Gosu::Button::KbUp
        @player.move_down if button_down? Gosu::Button::KbDown

        self.won! if @player.touch?(@ruby)
      end
    end

    def draw
      @background_image.draw(0, 0, 0)
      @font.draw("You won!", 200, 240, 2, 1.0, 1.0, 0xffffff00) if self.won?
      [@player, @ruby].each {|object| object.draw}
    end

    def button_down(id)
      self.close if id == Gosu::Button::KbEscape
      self.restart! if id == Gosu::Button::KbR
    end

    def player(player)
      @player = player
    end

    def ruby(ruby)
      @ruby = ruby
    end

    def start!(&block)
      @init = block if block_given?
      @init.call(self)
      [@player, @ruby].each {|object| object.init_image(self)}
      @player.init_limits(width, height, 15, 40)
      @state = :run
      self.show if block_given?
    end

    def restart!
      start!
    end

    def won!
      @state = :won
    end

    def run?
      @state == :run
    end

    def won?
      @state == :won
    end
  end
end