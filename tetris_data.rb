class TetrisData

  BLOCK_NONE = 0
  BLOCK_FIXED = 1
  BLOCK_UNFIXED = 2

  attr_reader :image_table

  def initialize(x, y)

    raise "Don't set the size of the field as 0." if x <= 0 or y <=0
    init_image_table x, y

  end

  def init_image_table(x, y)

    @image_table = Array.new(x + 2).map! do
      Array.new(y + 1, 0)
    end

    @image_table.each_with_index do |ex, ix|
      ex.each_index do |iy|
        if ix == 0 or ix == x + 1 or iy == y
          @image_table[ix][iy] = BLOCK_FIXED
        end
      end
    end

  end

  def set_block(block)
    @image_table[block.x + 1][block.y] = BLOCK_UNFIXED
  end

  def remove_block(block)
    @image_table[block.x + 1][block.y] = BLOCK_NONE
  end

  def right_block(block)

    if boundary_right? block

      remove_block block
      block.move_right
      set_block block

    end

  end

  def boundary_right?(block)

    xy = block.get_moved_right_points
    
    @image_table[xy[0] + 1][xy[1]] == BLOCK_NONE

  end

  def left_block(block)

    if boundary_left? block

      remove_block block
      block.move_left
      set_block block

    end

  end

  def boundary_left?(block)

    xy = block.get_moved_left_points
    
    @image_table[xy[0] + 1][xy[1]] == BLOCK_NONE

  end
  
  def down_block(block)

    if boundary_down? block

      remove_block block
      block.move_down
      set_block block

    end

  end

  def boundary_down?(block)

    xy = block.get_moved_down_points
    
    @image_table[xy[0] + 1][xy[1]] == BLOCK_NONE

  end
  
  def up_block(block)

    if boundary_up? block

      remove_block block
      block.move_up
      set_block block

    end

  end

  def boundary_up?(block)

    xy = block.get_moved_up_points
    
    @image_table[xy[0] + 1][xy[1]] == BLOCK_NONE

  end

end

