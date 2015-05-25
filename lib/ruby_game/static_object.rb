module RubyGame
  class StaticObject
    attr_accessor :x, :y

    def initialize(window, x, y, image_name)
      @x, @y = x, y
      @image_name = image_name
      @image = Gosu::Image.new(window, File.join(IMAGES_PATH, "#{@image_name}.png"), true)
    end

    def draw
      @image.draw_rot(@x, @y, 1, 0)
    end
  end
end
