module RubyGame
  class Player < StaticObject
    def initialize(x, y, image_name = 'player')
      super
      @velocity = 2
    end

    def touch?(object)
      Math.hypot(object.x - @x, object.y - @y) <= 1
    end

    def move_left(velocity = @velocity)
      @x -= velocity
    end

    def move_right(velocity = @velocity)
      @x += velocity
    end

    def move_up(velocity = @velocity)
      @y -= velocity
    end

    def move_down(velocity = @velocity)
      @y += velocity
    end
  end
end