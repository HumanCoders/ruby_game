require 'forwardable'
module RubyGame
  class StaticObject
    extend Forwardable
    def_delegator :@image, :width
    attr_accessor :x, :y

    def initialize(x, y, image_name)
      @x, @y = x, y
      @image_name = image_name
    end

    def init_image(window)
      @image = Gosu::Image.new(window, File.join(IMAGES_PATH, "#{@image_name}.png"), true)
    end

    def draw
      @image.draw_rot(@x, @y, 1, 0)
    end
  end
end