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

        @monsters.each do |monster|
          monster.follow(@player)
          self.lost! if monster.touch?(@player)
        end

        self.win! if @player.touch?(@ruby)
      end
    end

    def button_down(id)
      self.close if id == Gosu::Button::KbEscape
      self.restart! if id == Gosu::Button::KbR
    end

    def draw
      @background_image.draw(0, 0, 0)
      @font.draw("Game Over", 175, 240, 2, 1.0, 1.0, 0xffffff00) if self.lost?
      @font.draw("You win !", 200, 240, 2, 1.0, 1.0, 0xffffff00) if self.win?
      ([@player, @ruby] + @monsters).each {|object| object.draw}
    end

    def start!(&block)
      @monsters = []
      @init = block if block_given?
      @init.call(self)
      self.run!
      self.show if block_given?
    end

    alias_method :restart!, :start!

    %w(player ruby).each do |type|
      define_method(type) do |x, y|
        object = Object.const_get("RubyGame::#{type.capitalize}").new(x, y)
        object.init_image(self)
        instance_variable_set("@#{type}", object)
      end
    end

    def monsters(number)
      number.times do
        monster = Monster.new
        monster.init_image(self)
        @monsters << monster
      end
    end

    %w(lost win run).each do |state|
      define_method "#{state}!" do
        @state = state.to_sym
      end

      define_method "#{state}?" do
        @state == state.to_sym
      end
    end

  end
end
