module RubyGame
  class Player < StaticObject
    def initialize(window, x, y, image_name = 'player')
      super
      @speed = 3
    end

    def move_left
      @x -= @speed
    end

    def move_right
      @x += @speed
    end

    def move_up
      @y -= @speed
    end

    def move_down
      @y += @speed
    end
  end
end
