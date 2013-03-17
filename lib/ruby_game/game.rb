require 'gosu'

module RubyGame
  class Game < Gosu::Window
    def initialize(width, height, ruby)
      super(width, height, false)
      self.caption = "Ruby Game"
      @ruby = ruby
      @objects = [ruby]
      @objects.each {|object| object.init_image(self)}
      @background_image = Gosu::Image.new(self, File.join(RubyGame::IMAGES_PATH, 'background.png'), true)
    end

    def update
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