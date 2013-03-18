module RubyGame
  class Monster < MovingObject

    @@monsters = {}
    Action = Struct.new(:direction, :velocity)

    def initialize(x = 0, y = 0, image_name = 'ghost')
      super
      @velocity = 3
      @actions = []
      @action_index = 0
    end

    def self.build(name, number = 1)
      Array.new(number) {@@monsters[name].clone}
    end

    def init_limits(max_width, max_height, border_with, border_top_with)
      super
      @x = rand border_top_with..(max_width - 2*border_top_with)
      @y = rand border_top_with..(max_height - 2*border_top_with)
    end

    def self.define(name, &block)
      monster = Monster.new
      monster.instance_eval(&block)
      @@monsters[name] = monster
    end

    def image_name(image_name)
      @image_name = image_name
    end

    def velocity(velocity)
      @velocity = velocity
    end

    def action(direction, options = {})
      opts = {velocity: @velocity, repeat: 1}.merge options
      @actions += Array.new(opts[:repeat]) {Action.new(direction, opts[:velocity])}
    end

    def execute
      next_index = @action_index % @actions.length
      action = @actions[next_index]
      default_velocity = @velocity
      @velocity = action.velocity
      self.send(action.direction)
      @velocity = default_velocity
      @action_index = next_index + 1
    end
  end
end