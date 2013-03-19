module RubyGame
  class Monster < MovingObject
    def initialize(x = 0, y = 0, image_name = 'ghost1')
      super
    end
    
    def init_limits(max_width, max_height, border_with, border_top_with)
       super
       @x = rand border_top_with..(max_width - 2*border_top_with)
       @y = rand border_top_with..(max_height - 2*border_top_with)
    end
  end
end