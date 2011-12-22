require 'java'
require 'tetris_data'
require 'block'

import java.awt.Color
import java.awt.image.BufferedImage
import java.awt.event.KeyListener
import java.awt.event.KeyEvent
import java.io.File
import javax.swing.JFrame
import javax.imageio.ImageIO

class TetrisFrame < JFrame
  include KeyListener

  def initialize(title, x, y)
    super title
    set_default_close_operation JFrame::EXIT_ON_CLOSE
    add_key_listener self

    init_frame x, y
    @x_size = x
    @y_size = y

    @td = TetrisData.new x, y
    @block = Block.new 1, 1, [[0, -1], [1, 0], [1, 1]], 4
    @td.set_block @block
  end

  def init_frame(x, y)

    set_bounds 200, 200, x * 20, y * 20

  end

  def keyPressed(e)

    case e.get_key_code
    when KeyEvent::VK_RIGHT
      @td.right_block @block
    when KeyEvent::VK_LEFT
      @td.left_block @block
    when KeyEvent::VK_DOWN
      @td.down_block @block
    when KeyEvent::VK_UP
      @td.rotate_block @block
    when KeyEvent::VK_ENTER
      @block = Block.new 1, 1, [[0, -1], [0, 1], [1, 0]], 4
    end

    repaint
  end

  def keyReleased(e)
  end

  def paint(g)
    g.set_background Color::PINK
    g.clear_rect 0, 0, get_width, get_height

    read_image = ImageIO.read File.new("block.bmp")
    
    @td.image_table.each_with_index do |ex, x|
      ex.each_with_index do |ey, y|
        if x == 0 or x == @x_size + 1 or y == @y_size + 1
          next
        end
        if ey == TetrisData::BLOCK_UNFIXED
          g.draw_image read_image, (x-1) * 20, y * 20, self
        end
      end
    end

  end

end

