# require 'java'
# require 'tetris_data'
# require 'block'

# import java.awt.Color
# import java.awt.image.BufferedImage
# import java.awt.event.KeyListener
# import java.awt.event.KeyEvent
# import java.awt.event.ActionListener
# import java.io.File
# import javax.swing.JFrame
# import javax.swing.Timer
# import javax.imageio.ImageIO

# class TetrisFrame < JFrame
#   include KeyListener

#   def initialize(title, x, y)
#     super title
#     set_default_close_operation JFrame::EXIT_ON_CLOSE
#     add_key_listener self

#     init_frame x, y
#     @x_size = x
#     @y_size = y
    
#     @read_image = ImageIO.read File.new("block.bmp")

#     @td = TetrisData.new x, y
#     @block_datas = Array.new
#     @block_datas << [1, 1, [[0, -1], [1, 0], [0, 1]], 4]   # T
#     @block_datas << [1, 1, [[0, -1], [0, 1], [1, 1]], 4]   # L
#     @block_datas << [1, 1, [[0, -1], [0, 1], [-1, 1]], 4]  # reverse L
#     @block_datas << [1, 1, [[0, -1], [1, -1], [1, 0]], 0]  # square
#     @block_datas << [1, 1, [[0, -1], [0, 1], [0, 2]], 2]   # tetris
#     @block_datas << [1, 1, [[0, -1], [1, 0], [1, 1]], 2]   # key
#     @block_datas << [1, 1, [[0, -1], [-1, 0], [-1, 1]], 2] # reverse key

#     @down_count = 100

#     next_block

#     down_timer = Timer.new(10, nil)
#     down_timer.add_action_listener do |e|
#       @down_count = @down_count - 1

#       if @down_count <= 0
#         if !@td.down_block @block
#           @td.vanish_down_proc
#           next_block
#         end

#         repaint
#         @down_count = 100
#       end
#     end

#     down_timer.start

#   end

#   def init_frame(x, y)

#     set_bounds 200, 200, x * 20, y * 20

#   end

#   def keyPressed(e)

#     case e.get_key_code
#     when KeyEvent::VK_RIGHT
#       @td.right_block @block
#     when KeyEvent::VK_LEFT
#       @td.left_block @block
#     when KeyEvent::VK_DOWN
#       @down_count = 0
#     when KeyEvent::VK_UP
#       @td.rotate_block @block
#     end

#     repaint
#   end

#   def keyReleased(e)
#   end

#   def next_block
#     block_data = @block_datas[rand(@block_datas.size)]
#     @block = Block.new(block_data[0], block_data[1], block_data[2], block_data[3])
#     @td.set_block @block
#   end

#   def update(g)
#     paint(g)
#   end

#   def paint(g)

#     off_i = create_image(@x_size*20, @y_size*20)
#     off_g = off_i.get_graphics
#     off_g.set_background Color::PINK
#     off_g.clear_rect 0, 0, get_width, get_height

    
#     @td.image_table.each_with_index do |ex, x|
#       ex.each_with_index do |ey, y|
#         if x == 0 or x == @x_size + 1 or y == @y_size + 1
#           next
#         end
#         if ey == TetrisData::BLOCK_UNFIXED
#           off_g.draw_image @read_image, (x-1) * 20, y * 20, self
#         end
#       end
#     end

#     g.draw_image off_i, 0, 0, self
#   end

# end

