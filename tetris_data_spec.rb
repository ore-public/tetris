require 'tetris_data'
require 'block'

describe TetrisData do
  context '初期化(正常時)' do
    before do
      @td = TetrisData.new 3, 4
    end

    it do
      @td.image_table.should == [
        [1, 1, 1, 1, 1],
        [0, 0, 0, 0, 1],
        [0, 0, 0, 0, 1],
        [0, 0, 0, 0, 1],
        [1, 1, 1, 1, 1]
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

  context 'ブロックの配置' do
    before do
      @td = TetrisData.new 3, 3
      @block = Block.new 1, 1
      @td.set_block @block
    end

    it do
      @td.image_table.should == [
        [1, 1, 1, 1],
        [0, 0, 0, 1],
        [0, 2, 0, 1],
        [0, 0, 0, 1],
        [1, 1, 1, 1]
      ]
    end
  end

  context 'ブロックの消去' do
    before do
      @td = TetrisData.new 3, 3
      @block1 = Block.new 0, 0
      @block2 = Block.new 1, 1
      @td.set_block @block1
      @td.set_block @block2
      @td.remove_block @block2
    end

    it do
      @td.image_table.should == [
        [1, 1, 1, 1],
        [2, 0, 0, 1],
        [0, 0, 0, 1],
        [0, 0, 0, 1],
        [1, 1, 1, 1]
      ]
    end
  end

  context 'ブロックの右移動(移動可能)' do
    before do
      @td = TetrisData.new 3, 3
      @block = Block.new 0, 1
      @td.set_block @block
      @td.right_block @block
    end

    it do
      @td.image_table.should == [
        [1, 1, 1, 1],
        [0, 0, 0, 1],
        [0, 2, 0, 1],
        [0, 0, 0, 1],
        [1, 1, 1, 1]
      ]
    end
  end

  context 'ブロックの右移動(移動不可)' do
    before do
      @td = TetrisData.new 3, 3
      @block = Block.new 2, 1
      @td.set_block @block
      @td.right_block @block
    end

    it do
      @td.image_table.should == [
        [1, 1, 1, 1],
        [0, 0, 0, 1],
        [0, 0, 0, 1],
        [0, 2, 0, 1],
        [1, 1, 1, 1]
      ]
    end

  end

  context 'ブロックの左移動(移動可能)' do
    before do
      @td = TetrisData.new 3, 3
      @block = Block.new 1, 1
      @td.set_block @block
      @td.left_block @block
    end

    it do
      @td.image_table.should == [
        [1, 1, 1, 1],
        [0, 2, 0, 1],
        [0, 0, 0, 1],
        [0, 0, 0, 1],
        [1, 1, 1, 1]
      ]
    end
  end

  context 'ブロックの左移動(移動不可)' do
    before do
      @td = TetrisData.new 3, 3
      @block = Block.new 0, 1
      @td.set_block @block
      @td.left_block @block
    end

    it do
      @td.image_table.should == [
        [1, 1, 1, 1],
        [0, 2, 0, 1],
        [0, 0, 0, 1],
        [0, 0, 0, 1],
        [1, 1, 1, 1]
      ]
    end

  end
  
  context 'ブロックの下移動(移動可能)' do
    before do
      @td = TetrisData.new 3, 3
      @block = Block.new 0, 1
      @td.set_block @block
      @td.down_block @block
    end

    it do
      @td.image_table.should == [
        [1, 1, 1, 1],
        [0, 0, 2, 1],
        [0, 0, 0, 1],
        [0, 0, 0, 1],
        [1, 1, 1, 1]
      ]
    end
  end

  context 'ブロックの下移動(移動不可)' do
    before do
      @td = TetrisData.new 3, 3
      @block = Block.new 2, 2 
      @td.set_block @block
      @td.down_block @block
    end

    it do
      @td.image_table.should == [
        [1, 1, 1, 1],
        [0, 0, 0, 1],
        [0, 0, 0, 1],
        [0, 0, 2, 1],
        [1, 1, 1, 1]
      ]
    end

  end
  
  context 'ブロックの上移動(移動可能)' do
    before do
      @td = TetrisData.new 3, 3
      @block = Block.new 0, 1
      @td.set_block @block
      @td.up_block @block
    end

    it do
      @td.image_table.should == [
        [1, 1, 1, 1],
        [2, 0, 0, 1],
        [0, 0, 0, 1],
        [0, 0, 0, 1],
        [1, 1, 1, 1]
      ]
    end
  end

  context '複数マスブロックの配置' do
    before do
      @td = TetrisData.new 6, 6
      @block = Block.new 2, 1, [[0, -1], [0, 1], [1, 1]]
      @td.set_block @block
    end

    it do
      @td.image_table.should == [
        [1, 1, 1, 1, 1, 1, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [2, 2, 2, 0, 0, 0, 1],
        [0, 0, 2, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [1, 1, 1, 1, 1, 1, 1]
      ]
    end
  end
  
  context '複数マスブロックの右移動' do
    before do
      @td = TetrisData.new 6, 6
      @block = Block.new 2, 1, [[0, -1], [0, 1], [1, 1]]
      @td.set_block @block
      @td.right_block @block
    end

    it do
      @td.image_table.should == [
        [1, 1, 1, 1, 1, 1, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [2, 2, 2, 0, 0, 0, 1],
        [0, 0, 2, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [1, 1, 1, 1, 1, 1, 1]
      ]
    end
  end

  context '複数マスブロックの右移動(不可)' do
    before do
      @td = TetrisData.new 6, 6
      @block = Block.new 4, 1, [[0, -1], [0, 1], [1, 1]]
      @td.set_block @block
      @td.right_block @block
    end

    it do
      @td.image_table.should == [
        [1, 1, 1, 1, 1, 1, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [2, 2, 2, 0, 0, 0, 1],
        [0, 0, 2, 0, 0, 0, 1],
        [1, 1, 1, 1, 1, 1, 1]
      ]
    end
  end

  context '複数マスブロックの左移動' do
    before do
      @td = TetrisData.new 6, 6
      @block = Block.new 2, 1, [[0, -1], [0, 1], [1, 1]]
      @td.set_block @block
      @td.left_block @block
    end

    it do
      @td.image_table.should == [
        [1, 1, 1, 1, 1, 1, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [2, 2, 2, 0, 0, 0, 1],
        [0, 0, 2, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [1, 1, 1, 1, 1, 1, 1]
      ]
    end
  end

  context '複数マスブロックの左移動(不可)' do
    before do
      @td = TetrisData.new 6, 6
      @block = Block.new 0, 1, [[0, -1], [0, 1], [1, 1]]
      @td.set_block @block
      @td.left_block @block
    end

    it do
      @td.image_table.should == [
        [1, 1, 1, 1, 1, 1, 1],
        [2, 2, 2, 0, 0, 0, 1],
        [0, 0, 2, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [1, 1, 1, 1, 1, 1, 1]
      ]
    end
  end
  context '複数マスブロックの下移動' do
    before do
      @td = TetrisData.new 6, 6
      @block = Block.new 2, 1, [[0, -1], [0, 1], [1, 1]]
      @td.set_block @block
      @td.down_block @block
    end

    it do
      @td.image_table.should == [
        [1, 1, 1, 1, 1, 1, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 2, 2, 2, 0, 0, 1],
        [0, 0, 0, 2, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [1, 1, 1, 1, 1, 1, 1]
      ]
    end
  end

  context '複数マスブロックの下移動(不可)' do
    before do
      @td = TetrisData.new 6, 6
      @block = Block.new 2, 4, [[0, -1], [0, 1], [1, 1]]
      @td.set_block @block
      @td.down_block @block
    end

    it do
      @td.image_table.should == [
        [1, 1, 1, 1, 1, 1, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 2, 2, 2, 1],
        [0, 0, 0, 0, 0, 2, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [1, 1, 1, 1, 1, 1, 1]
      ]
    end
  end
  context '複数マスブロックの上移動' do
    before do
      @td = TetrisData.new 6, 6
      @block = Block.new 2, 2, [[0, -1], [0, 1], [1, 1]]
      @td.set_block @block
      @td.up_block @block
    end

    it do
      @td.image_table.should == [
        [1, 1, 1, 1, 1, 1, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [2, 2, 2, 0, 0, 0, 1],
        [0, 0, 2, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [1, 1, 1, 1, 1, 1, 1]
      ]
    end
  end

  context '複数マスブロックの上移動(不可)' do
    before do
      @td = TetrisData.new 6, 6
      @block = Block.new 1, 1, [[0, -1], [0, 1], [1, 1]]
      @td.set_block @block
      @td.up_block @block
    end

    it do
      @td.image_table.should == [
        [1, 1, 1, 1, 1, 1, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [2, 2, 2, 0, 0, 0, 1],
        [0, 0, 2, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [1, 1, 1, 1, 1, 1, 1]
      ]
    end
  end
  context '複数マスブロックの消去' do
    before do
      @td = TetrisData.new 6, 6
      @block1 = Block.new 2, 1, [[0, -1], [0, 1], [1, 1]]
      @block2 = Block.new 3, 4, [[0, -1], [0, 1], [1, 1]]
      @td.set_block @block1
      @td.set_block @block2
      @td.remove_block @block1
    end

    it do
      @td.image_table.should == [
        [1, 1, 1, 1, 1, 1, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 2, 2, 2, 1],
        [0, 0, 0, 0, 0, 2, 1],
        [0, 0, 0, 0, 0, 0, 1],
        [1, 1, 1, 1, 1, 1, 1]
      ]
    end
  end
end

