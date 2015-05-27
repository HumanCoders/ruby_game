module RubyGame
  class Monster < StaticObject

    include Movable

    attr_accessor :target
    @@monsters_type = {}
    Action = Struct.new(:direction, :speed)

    def initialize(x = 0, y = 0, image_name = 'ghost1')
      super
      @speed = 1
      @actions = []
    end

    def self.build(type)
      monster = @@monsters_type[type].clone
      monster.x = rand(100..500)
      monster.y = rand(100..400)
      monster
    end

    def self.define(type, &block)
      monster = Monster.new
      monster.instance_eval(&block)
      @@monsters_type[type] = monster
    end

    def action(direction, speed: @speed, repeat: 1)
      @actions += Array.new(repeat) {Action.new(direction, speed)}
    end

    def execute
      @actions_enum ||= @actions.cycle
      action = @actions_enum.next
      self.send(action.direction, action.speed)
    end

    def image_name(image_name)
      @image_name = image_name
    end

    def speed(speed)
      @speed = speed
    end

    def follow(target = @target)
      @x += (target.x <=> @x) * @speed
      @y += (target.y <=> @y) * @speed
    end
  end
end
