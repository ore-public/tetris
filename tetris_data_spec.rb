require 'tetris_data'

describe TetrisData do
  context '初期化(正常時)' do
    before do
      @td = TetrisData.new 3, 4
    end

    it { @td.image_table.should have(3).items }
    it { @td.image_table[0].should have(4).items }
    it { @td.image_table[1].should have(4).items }
    it { @td.image_table[2].should have(4).items }
    it { @td.image_table[3].should be_nil }
    it do
      @td.image_table.should == [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]
    end

  end

  context '初期化（異常）' do
      
    it 'Y サイズ0' do lambda {TetrisData.new 3, 0}.should raise_error end
    it 'X サイズ0' do lambda {TetrisData.new 0, 3}.should raise_error end
    it 'XY サイズ0' do lambda {TetrisData.new 0, 0}.should raise_error end
    it 'Y サイズ-' do lambda {TetrisData.new 3, -1}.should raise_error end
    it 'X サイズ-' do lambda {TetrisData.new -1, 3}.should raise_error end
    it 'XY サイズ-' do lambda {TetrisData.new -2, -1}.should raise_error end

  end

  context 'ブロックの配置(正常時)' do
    before do
      @td = TetrisData.new 3, 3
      @td.set_block(1, 1)
    end

    it do
      @td.image_table.should == [
        [0, 0, 0],
        [0, 2, 0],
        [0, 0, 0]
      ]
    end
  end

  context 'ブロックの配置（異常)' do
    before do
      @td = TetrisData.new 2, 2
    end
    
    it { lambda {@td.set_block(-1, 0)}.should raise_error }
    it { lambda {@td.set_block(0, -1)}.should raise_error }
    it { lambda {@td.set_block(-1, -1)}.should raise_error }
    it { lambda {@td.set_block(0, 0)}.should_not raise_error }

  end

  context 'ブロックの右移動(移動可能)' do
    before do
      @td = TetrisData.new 3, 3
    end

    it '右移動'

  end

  context 'ブロックの右移動(移動不可)' do
    before do
      @td = TetrisData.new 3, 3
    end

    it '右端で移動不可'
    it '右側にFixブロックありで移動不可'

  end
end

