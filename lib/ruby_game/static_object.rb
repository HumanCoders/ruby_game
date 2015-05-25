module RubyGame
  class StaticObject
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

    def touch?(target)
      Math.hypot(target.x - @x, target.y - @y) <= @image.width / 2
    end
  end
end
