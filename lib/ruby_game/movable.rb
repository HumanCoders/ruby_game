module Movable
  def move_left(speed = @speed)
    @x -= speed
  end

  def move_right(speed = @speed)
    @x += speed
  end

  def move_up(speed = @speed)
    @y -= speed
  end

  def move_down(speed = @speed)
    @y += speed
  end
end
