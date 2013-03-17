module RubyGame
  class MovingObject < StaticObject
    def initialize(x, y, image_name)
      super
      @velocity = 2
    end

    def init_limits(max_width, max_height, border_with, border_top_with)
      @max_width, @max_height = max_width, max_height
      @border_with, @border_top_with = border_with, border_top_with
    end

    def touch?(object)
      Math.hypot(object.x - @x, object.y - @y) <= object.width/2
    end

    def move_left
      @x -= @velocity if @x > @border_with + (@image.width/2)
    end

    def move_right
      @x += @velocity if @x < @max_width - @border_with - (@image.width/2)
    end

    def move_up
      @y -= @velocity if @y > @border_with + @border_top_with + (@image.height/2)
    end

    def move_down
      @y += @velocity if @y < @max_height - @border_with - (@image.height/2)
    end
  end
end