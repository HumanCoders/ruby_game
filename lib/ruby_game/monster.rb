module RubyGame
  class Monster < MovingObject

    @@monsters = {}
    Action = Struct.new(:direction, :velocity)

    def initialize(x = 0, y = 0, image_name = 'ghost1')
      super
      @actions = []
    end

    def self.build(name)
      @@monsters[name].clone
    end

    def init_limits(max_width, max_height, border_with, border_top_with)
       super
       @x = rand border_top_with..(max_width - 2*border_top_with)
       @y = rand border_top_with..(max_height - 2*border_top_with)
    end

    def forward(player, velocity = @velocity)
      @x += (player.x <=> @x) * velocity
      @y += (player.y <=> @y) * velocity
    end

    def self.define(name)
      monster = Monster.new
      yield(monster)
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

    def execute(player)
      @actions_enum ||= @actions.cycle
      action = @actions_enum.next
      if action.direction == :forward
        self.send(action.direction, player, action.velocity)
      else
        self.send(action.direction, action.velocity)
      end
    end
  end
end