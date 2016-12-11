# class TestTetris < MTest::Unit::TestCase
#   def test_main
#     assert_nil __main__([])
#   end
# end

class TestBlock < MTest::Unit::TestCase
  def setup
    @block = Block.new(0, 1)
  end

  def test_init_x
    assert_equal(@block.x, 0)
  end

  def test_init_y
    assert_equal(@block.y, 1)
  end

  def test_sp
    assert_nil(@block.sp)
  end

  def test_current_r
    assert_equal(@block.current_r, 0)
  end
end

class TestBlockMulti < MTest::Unit::TestCase
  def setup
    @block = Block.new(0, 1, [[0, -2], [0, -1], [1, 0]], 4)
  end

  def test_sp
    assert_equal(@block.sp, [[0, -2], [0, -1], [1, 0]])
  end

  def test_current_r
    assert_equal(@block.current_r, 0)
  end

  def test_round1
    @block.rotate
    assert_equal(@block.current_r, 1)
  end

  def test_round4
    4.times do
      @block.rotate
    end
    assert_equal(@block.current_r, 0)
  end
end

class TestBlockError < MTest::Unit::TestCase
  def test_error1
    assert_raise RuntimeError do
      Block.new(-1, 0)
    end
  end

  def test_error2
    assert_raise RuntimeError do
      Block.new(0, -1)
    end
  end

  def test_error3
    assert_raise RuntimeError do
      Block.new(-1, -1)
    end
  end
end

#   describe '移動後の座標計算' do
#     subject do
#       Block.new(1, 1)
#     end

#     it '右' do
#       subject.get_moved_right_points.should == [
#         2, 1
#       ]
#     end
    
#     it '左' do
#       subject.get_moved_left_points.should == [
#         0, 1
#       ]
#     end

#     it '下' do
#       subject.get_moved_down_points.should == [
#         1, 2 
#       ]
#     end

#     it '上' do
#       subject.get_moved_up_points.should == [
#         1, 0 
#       ]
#     end

#   end

#   describe '回転ごの回転数計算' do
#     subject do
#       Block.new(1, 1, [[0, -1], [0, 1], [1, 1]], 4)
#     end

#     it '1回転' do
#       subject.get_rotated_count.should == 1
#     end

#     it '4回転' do
#       3.times do
#         subject.rotate
#       end

#       subject.get_rotated_count.should == 0

#     end
#   end

#   describe '移動(右)' do
#     subject do
#       block = Block.new(1, 1)
#       block.move_right
#       block
#     end

#     it '右移動時にx座標が1だけ変化する' do
#       subject.x.should == 2
#     end

#     it '右移動時にy座標が変化しない' do
#       subject.y.should == 1
#     end
#   end

#   describe '移動(左)' do
#     subject do
#       block = Block.new 1, 1
#       block.move_left
#       block
#     end

#     it '左移動時にx座標が-1だけ変化する' do
#       subject.x.should == 0 
#     end

#     it '左移動時にy座標が変化しない' do
#       subject.y.should == 1
#     end
#   end
  
#   describe '移動(下)' do
#     subject do
#       block = Block.new 1, 1
#       block.move_down
#       block
#     end

#     it '下移動時にx座標が変化しない' do
#       subject.x.should == 1 
#     end

#     it '下移動時にy座標が1変化する' do
#       subject.y.should == 2
#     end
#   end
  
#   describe '移動(上)' do
#     subject do
#       block = Block.new 1, 1
#       block.move_up
#       block
#     end

#     it '上移動時にx座標が変化しない' do
#       subject.x.should == 1 
#     end

#     it '上移動時にy座標が-1変化する' do
#       subject.y.should == 0 
#     end
#   end
# end

MTest::Unit.new.run