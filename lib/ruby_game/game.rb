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
        @player.move_left if button_down?(Gosu::Button::KbLeft)
        @player.move_right if button_down?(Gosu::Button::KbRight)
        @player.move_up if button_down?(Gosu::Button::KbUp)
        @player.move_down if button_down?(Gosu::Button::KbDown)

        @monster.follow(@player)
        self.lost! if @monster.touch?(@player)
      end
    end

    def draw
      @background_image.draw(0, 0, 0)
      @font.draw("Game Over", 175, 240, 2, 1.0, 1.0, 0xffffff00) if self.lost?
      [@player, @ruby, @monster].each {|object| object.draw}
    end

    def start!
      yield(self)
      self.run!
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

    def monster(x, y)
      @monster = Monster.new(x, y)
      @monster.init_image(self)
    end

    def lost!
      @state = :lost
    end

    def lost?
      @state == :lost
    end

    def run!
      @state = :run
    end

    def run?
      @state == :run
    end
  end
end
