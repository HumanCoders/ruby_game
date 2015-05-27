module RubyGame
  class Player < StaticObject
    include Movable

    def initialize(x, y, image_name = 'player')
      super
      @speed = 3
    end
  end
end
