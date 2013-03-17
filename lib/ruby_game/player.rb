module RubyGame
  class Player < StaticObject
    def initialize(x, y, image_name = 'player')
      super
      @velocity = 2
    end

    def touch?(object)
      Math.hypot(object.x - @x, object.y - @y) <= 1
    end

    def move_left
      @x -= @velocity
    end

    def move_right
      @x += @velocity
    end

    def move_up
      @y -= @velocity
    end

    def move_down
      @y += @velocity
    end
  end
end