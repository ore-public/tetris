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

  def set_block_status(block, status)
    center_x = block.x + 1
    center_y = block.y

    @image_table[center_x][center_y] = status
    
    if !block.sp.nil?
      calc_rotate_sp(block.sp, block.current_r).each do |v|
        @image_table[center_x + v[0]][center_y + v[1]] = status
      end
    end
  end

  def set_block(block)
    set_block_status block, BLOCK_UNFIXED
  end
  
  def remove_block(block)
    set_block_status block, BLOCK_NONE
  end

  def right_block(block)

    remove_block block
    if boundary_right? block
      block.move_right
    end
    set_block block

  end

  def boundary?(xy, sp, rotate_count)
    
    points = Array.new
    if !sp.nil?
      calc_rotate_sp(sp, rotate_count).each do |v|
        points << [xy[0] + v[0] + 1, xy[1] + v[1]]
      end
    end
    points << [xy[0] + 1, xy[1]]

    points.each do |v|
      if @image_table[v[0]][v[1]] != BLOCK_NONE
        return false
      end
    end

    return true
  end

  def rotate_block(block)
    remove_block block
    if boundary_rotate? block
      block.rotate
    end
    set_block block
  end

  def boundary_rotate?(block)

    boundary?(
      [block.x, block.y],
      block.sp, block.get_rotated_count
    )

  end

  def calc_rotate_sp(sp, rotate_count)

    return sp if rotate_count == 0

    new_sp = Array.new
    sp.each_index do |idx|
      new_sp << [sp[idx][1] * -1, sp[idx][0]]
    end

    return calc_rotate_sp(new_sp, rotate_count - 1)

  end

  def boundary_right?(block)

    boundary?(block.get_moved_right_points, block.sp, block.current_r)

  end

  def left_block(block)

    remove_block block
    if boundary_left? block
      block.move_left
    end
    set_block block

  end

  def boundary_left?(block)

    boundary?(block.get_moved_left_points, block.sp, block.current_r)

  end
  
  def down_block(block)

    remove_block block
    if boundary_down? block
      block.move_down
    end
    set_block block

  end

  def boundary_down?(block)

    boundary?(block.get_moved_down_points, block.sp, block.current_r)

  end
  
  def up_block(block)

    remove_block block
    if boundary_up? block
      block.move_up
    end
    set_block block

  end

  def boundary_up?(block)

    boundary?(block.get_moved_up_points, block.sp, block.current_r)

  end

end

