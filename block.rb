class Block

  attr_reader :x, :y, :sp

  def initialize(x, y, sp = nil)

    if x < 0 or y < 0
      raise "X,Y point not set minus value."
    end

    @x = x
    @y = y
    @sp = sp
  end

  def get_moved_right_points
    [@x + 1, @y]
  end

  def get_moved_left_points
    [@x - 1, @y]
  end

  def get_moved_up_points
    [@x, @y - 1]
  end

  def get_moved_down_points
    [@x, @y + 1]
  end

  def move_right
    @x = @x + 1
  end

  def move_left
    @x = @x - 1
  end

  def move_down
    @y = @y + 1
  end

  def move_up
    @y = @y - 1
  end
end
