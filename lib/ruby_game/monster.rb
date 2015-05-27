module RubyGame
  class Monster < StaticObject

    @@monsters_type = {}
    Action = Struct.new(:direction, :speed)

    def initialize(x = 0, y = 0, image_name = 'ghost1')
      super
      @speed = 1
      @actions = []
    end

    def self.build(type)
      monster = @@monsters_type[type].clone
      monster.x = rand(0..400)
      monster.y = rand(0..400)
      monster
    end

    def self.define(type)
      monster = Monster.new
      yield(monster)
      @@monsters_type[type] = monster
    end

    def image_name(image_name)
      @image_name = image_name
    end

    def speed(speed)
      @speed = speed
    end

    def action(direction, speed: @speed, repeat: 1)
      @actions += Array.new(repeat) {Action.new(direction, speed)}
    end

    def follow(target)
      @x += (target.x <=> @x) * @speed
      @y += (target.y <=> @y) * @speed
    end
  end
end
