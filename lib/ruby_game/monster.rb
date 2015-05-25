module RubyGame
  class Monster < StaticObject
    def initialize(x = rand(0..400), y = rand(0..400), image_name = 'ghost1')
      super
      @speed = 1
    end

    def follow(target)
      @x += (target.x <=> @x) * @speed
      @y += (target.y <=> @y) * @speed
    end
  end
end
