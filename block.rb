class Block

  attr_reader :x, :y, :sp, :current_r

  def initialize(x, y, sp = nil, r = 0)

    if x < 0 or y < 0
      raise "X,Y point not set minus value."
    end

    @x = x
    @y = y
    @sp = sp
    @r = r
    @current_r = 0

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

  def get_rotated_count
    if @current_r == @r -1
      0
    else
      @current_r + 1
    end
  end

  def rotate
    @current_r = @current_r + 1
    if @current_r == @r
      @current_r = 0
    end
  end
end
