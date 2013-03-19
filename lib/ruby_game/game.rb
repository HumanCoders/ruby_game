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

        @monster.forward(@player, 1)

        self.won! if @player.touch?(@ruby)
        self.gameover! if @monster.touch?(@player)
      end
    end

    def draw
      @background_image.draw(0, 0, 0)
      @font.draw("You won!", 200, 240, 2, 1.0, 1.0, 0xffffff00) if self.won?
      @font.draw("Game Over", 175, 240, 2, 1.0, 1.0, 0xffffff00) if self.gameover?
      [@player, @ruby, @monster].each {|object| object.draw}
    end

    def button_down(id)
      self.close if id == Gosu::Button::KbEscape
      self.restart! if id == Gosu::Button::KbR
    end

    %w(player ruby monster).each do |object|
      define_method object do |value|
        instance_variable_set("@#{object}", value)
      end
    end

    def start!(&block)
      @init = block if block_given?
      @init.call(self)
      [@player, @ruby, @monster].each {|object| object.init_image(self)}
      [@player, @monster].each {|object| object.init_limits(width, height, 15, 40)}
      @state = :run
      self.show if block_given?
    end
    alias_method :restart!, :start!

    def won!
      @state = :won
    end

    def gameover!
      @state = :gameover
    end

    %w(won run gameover).each do |state|
      define_method "#{state}?" do
        @state == state.to_sym
      end
    end
  end
end