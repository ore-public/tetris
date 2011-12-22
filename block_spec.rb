require 'block'

describe Block do
  context '初期化 1マスブロック' do
    before do
      @block = Block.new 0, 1
    end

    it '初期化座標xが設定されている' do
      @block.x.should == 0
    end

    it '初期化座標yが設定されている' do
      @block.y.should == 1
    end

    it '複数マスブロック要素がNilである' do
      @block.sp.should be_nil
    end

    it '回転状態の値が 0である' do
      @block.current_r.should == 0
    end

  end

  context '初期化 複数マスブロック' do

    before do
      @block = Block.new 0, 1, [[0, -2], [0, -1], [1, 0]], 4
    end

    it 'ブロック要素の相対座標がセットされている' do
      @block.sp.should == [[0, -2], [0, -1], [1, 0]]
    end
    
    it '回転状態の値が 0である' do
      @block.current_r.should == 0
    end

    it '回転1回 回転状態が1進む' do
      @block.rotate
      @block.current_r.should == 1
    end

    it '回転4回 回転状態が0に戻る' do
      4.times do
        @block.rotate
      end
      @block.current_r.should == 0
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

  context '回転ごの回転数計算' do
    before do
      @block = Block.new 1, 1, [[0, -1], [0, 1], [1, 1]], 4
    end

    it '1回転' do
      @block.get_rotated_count.should == 1
    end

    it '4回転' do
      3.times do
        @block.rotate
      end

      @block.get_rotated_count.should == 0

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

    it '左移動時にx座標が-1だけ変化する' do
      @block.x.should == 0 
    end

    it '左移動時にy座標が変化しない' do
      @block.y.should == 1
    end
  end
  
  context '移動(下)' do
    before do
      @block = Block.new 1, 1
      @block.move_down
    end

    it '下移動時にx座標が変化しない' do
      @block.x.should == 1 
    end

    it '下移動時にy座標が1変化する' do
      @block.y.should == 2
    end
  end
  
  context '移動(上)' do
    before do
      @block = Block.new 1, 1
      @block.move_up
    end

    it '上移動時にx座標が変化しない' do
      @block.x.should == 1 
    end

    it '上移動時にy座標が-1変化する' do
      @block.y.should == 0 
    end
  end

end

