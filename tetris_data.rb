class TetrisData

  BLOCK_NONE = 0
  BLOCK_FIXED = 1
  BLOCK_UNFIXED = 2

  attr_reader :image_table

  def initialize(x, y)

    raise "Don't set the size of the field as 0." if x == 0 or y ==0
    init_image_table x, y

  end

  def init_image_table(x, y)

    @x_size = x - 1
    @y_size = y - 1

    @image_table = Array.new(x).map! do
      Array.new(y, 0)
    end

  end

  def set_block(x, y)

    raise "Don't set minus value. (set >= 0)" if x < 0 or y < 0
    @image_table[x][y] = BLOCK_UNFIXED

  end

  def right_block

    if !boundary_right?
      @image_table.each_with_index do |ex, x|
        ex.each_with_index do |ey, y|
          if ey == BLOCK_UNFIXED
            ey = BLOCK_NONE
            @image_table[x + 1][y] = BLOCK_UNFIXED
          end
        end
      end
    end

  end

  def boundary_right?

    @image_table[@x_size].index(BLOCK_UNFIXED)

  end

end

