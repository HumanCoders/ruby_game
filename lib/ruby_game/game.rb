require 'gosu'

module RubyGame
  class Game < Gosu::Window
    def initialize(width, height)
      super(width, height, false)
      self.caption = "Ruby Game"
      @background_image = Gosu::Image.new(self, File.join(RubyGame::IMAGES_PATH, 'background.png'), true)
      @font = Gosu::Font.new(self, Gosu::default_font_name, 60)
    end

    def update
      if self.run?
        @player.move_left if button_down? Gosu::Button::KbLeft
        @player.move_right if button_down? Gosu::Button::KbRight
        @player.move_up if button_down? Gosu::Button::KbUp
        @player.move_down if button_down? Gosu::Button::KbDown

        @monsters.each do |monster|
          monster.execute
          self.gameover! if monster.touch?(@player)
        end

        self.won! if @player.touch?(@ruby)
      end
    end

    def draw
      @background_image.draw(0, 0, 0)
      @font.draw("You won!", 200, 240, 2, 1.0, 1.0, 0xffffff00) if self.won?
      @font.draw("Game Over", 175, 240, 2, 1.0, 1.0, 0xffffff00) if self.gameover?
      ([@ruby, @player] + @monsters).each {|object| object.draw}
    end

    def button_down(id)
      close if id == Gosu::Button::KbEscape
      self.restart! if id == Gosu::Button::KbR
    end

    def monsters(monsters)
      @monsters += monsters
    end

    %w(player ruby).each do |object|
      define_method object do |value|
        instance_variable_set("@#{object}", value)
      end
    end

    def start!(&block)
      @monsters = []
      @init = block if block_given?
      @init.call(self)
      ([@ruby, @player] + @monsters).each {|object| object.init_image(self)}
      ([@player] + @monsters).each {|moving_object| moving_object.init_limits(width, height, 15, 40)}
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