require 'block'

describe Block do
  context '初期化' do
    before do
      @block = Block.new 0, 1
    end

    it '初期化座標xが設定されている' do
      @block.x.should == 0
    end

    it '初期化座標yが設定されている' do
      @block.y.should == 1
    end
  end

  context '初期化（異常）' do
    it { lambda{Block.new -1, 0}.should raise_error}
    it { lambda{Block.new 0, -1}.should raise_error}
    it { lambda{Block.new -1, -1}.should raise_error}
    it { lambda{Block.new 0, 0}.should_not raise_error}
  end

  context '移動後の座標計算' do
    before do
      @block = Block.new 1, 1
    end

    it '右' do
      @block.get_moved_right_points.should == [
        2, 1
      ]
    end
    
    it '左' do
      @block.get_moved_left_points.should == [
        0, 1
      ]
    end

    it '下' do
      @block.get_moved_down_points.should == [
        1, 2 
      ]
    end

    it '上' do
      @block.get_moved_up_points.should == [
        1, 0 
      ]
    end

  end

  context '移動(右)' do
    before do
      @block = Block.new 1, 1
      @block.move_right
    end

    it '右移動時にx座標が1だけ変化する' do
      @block.x.should == 2
    end

    it '右移動時にy座標が変化しない' do
      @block.y.should == 1
    end
  end

  context '移動(左)' do
    before do
      @block = Block.new 1, 1
      @block.move_left
    end

    it '右移動時にx座標が-1だけ変化する' do
      @block.x.should == 0 
    end

    it '右移動時にy座標が変化しない' do
      @block.y.should == 1
    end
  end
  
  context '移動(下)' do
    before do
      @block = Block.new 1, 1
      @block.move_down
    end

    it '右移動時にx座標が変化しない' do
      @block.x.should == 1 
    end

    it '右移動時にy座標が1変化する' do
      @block.y.should == 2
    end
  end
  
  context '移動(上)' do
    before do
      @block = Block.new 1, 1
      @block.move_up
    end

    it '右移動時にx座標が変化しない' do
      @block.x.should == 1 
    end

    it '右移動時にy座標が-1変化する' do
      @block.y.should == 0 
    end
  end
end

