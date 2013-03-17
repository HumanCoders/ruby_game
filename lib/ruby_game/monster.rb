module RubyGame
  class Monster < MovingObject
    def initialize(x, y, image_name = 'ghost')
      super
      @velocity = 3
    end
  end
end