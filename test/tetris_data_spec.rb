# describe TetrisData do
#   context '初期化(正常時)' do
#     before do
#       @td = TetrisData.new 3, 4
#     end

#     it do
#       @td.image_table.should == [
#         [1, 1, 1, 1, 1],
#         [0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 1],
#         [1, 1, 1, 1, 1]
#       ]
#     end

#   end

#   context '初期化（異常）' do
      
#     it 'Y サイズ0' do lambda {TetrisData.new 3, 0}.should raise_error end
#     it 'X サイズ0' do lambda {TetrisData.new 0, 3}.should raise_error end
#     it 'XY サイズ0' do lambda {TetrisData.new 0, 0}.should raise_error end
#     it 'Y サイズ-' do lambda {TetrisData.new 3, -1}.should raise_error end
#     it 'X サイズ-' do lambda {TetrisData.new -1, 3}.should raise_error end
#     it 'XY サイズ-' do lambda {TetrisData.new -2, -1}.should raise_error end

#   end

#   context 'ブロックの配置' do
#     before do
#       @td = TetrisData.new 3, 3
#       @block = Block.new 1, 1
#       @td.set_block @block
#     end

#     it do
#       @td.image_table.should == [
#         [1, 1, 1, 1],
#         [0, 0, 0, 1],
#         [0, 2, 0, 1],
#         [0, 0, 0, 1],
#         [1, 1, 1, 1]
#       ]
#     end
#   end

#   context 'ブロックの消去' do
#     before do
#       @td = TetrisData.new 3, 3
#       @block1 = Block.new 0, 0
#       @block2 = Block.new 1, 1
#       @td.set_block @block1
#       @td.set_block @block2
#       @td.remove_block @block2
#     end

#     it do
#       @td.image_table.should == [
#         [1, 1, 1, 1],
#         [2, 0, 0, 1],
#         [0, 0, 0, 1],
#         [0, 0, 0, 1],
#         [1, 1, 1, 1]
#       ]
#     end
#   end

#   context 'ブロックの右移動(移動可能)' do
#     before do
#       @td = TetrisData.new 3, 3
#       @block = Block.new 0, 1
#       @td.set_block @block
#       @td.right_block @block
#     end

#     it do
#       @td.image_table.should == [
#         [1, 1, 1, 1],
#         [0, 0, 0, 1],
#         [0, 2, 0, 1],
#         [0, 0, 0, 1],
#         [1, 1, 1, 1]
#       ]
#     end
#   end

#   context 'ブロックの右移動(移動不可)' do
#     before do
#       @td = TetrisData.new 3, 3
#       @block = Block.new 2, 1
#       @td.set_block @block
#       @td.right_block @block
#     end

#     it do
#       @td.image_table.should == [
#         [1, 1, 1, 1],
#         [0, 0, 0, 1],
#         [0, 0, 0, 1],
#         [0, 2, 0, 1],
#         [1, 1, 1, 1]
#       ]
#     end

#   end

#   context 'ブロックの左移動(移動可能)' do
#     before do
#       @td = TetrisData.new 3, 3
#       @block = Block.new 1, 1
#       @td.set_block @block
#       @td.left_block @block
#     end

#     it do
#       @td.image_table.should == [
#         [1, 1, 1, 1],
#         [0, 2, 0, 1],
#         [0, 0, 0, 1],
#         [0, 0, 0, 1],
#         [1, 1, 1, 1]
#       ]
#     end
#   end

#   context 'ブロックの左移動(移動不可)' do
#     before do
#       @td = TetrisData.new 3, 3
#       @block = Block.new 0, 1
#       @td.set_block @block
#       @td.left_block @block
#     end

#     it do
#       @td.image_table.should == [
#         [1, 1, 1, 1],
#         [0, 2, 0, 1],
#         [0, 0, 0, 1],
#         [0, 0, 0, 1],
#         [1, 1, 1, 1]
#       ]
#     end

#   end
  
#   context 'ブロックの下移動(移動可能)' do
#     before do
#       @td = TetrisData.new 3, 3
#       @block = Block.new 0, 1
#       @td.set_block @block
#       @td.down_block @block
#     end

#     it do
#       @td.image_table.should == [
#         [1, 1, 1, 1],
#         [0, 0, 2, 1],
#         [0, 0, 0, 1],
#         [0, 0, 0, 1],
#         [1, 1, 1, 1]
#       ]
#     end
#   end

#   context 'ブロックの下移動(移動不可)' do
#     before do
#       @td = TetrisData.new 3, 3
#       @block = Block.new 2, 2 
#       @td.set_block @block
#       @td.down_block @block
#     end

#     it do
#       @td.image_table.should == [
#         [1, 1, 1, 1],
#         [0, 0, 0, 1],
#         [0, 0, 0, 1],
#         [0, 0, 2, 1],
#         [1, 1, 1, 1]
#       ]
#     end

#   end
  
#   context 'ブロックの上移動(移動可能)' do
#     before do
#       @td = TetrisData.new 3, 3
#       @block = Block.new 0, 1
#       @td.set_block @block
#       @td.up_block @block
#     end

#     it do
#       @td.image_table.should == [
#         [1, 1, 1, 1],
#         [2, 0, 0, 1],
#         [0, 0, 0, 1],
#         [0, 0, 0, 1],
#         [1, 1, 1, 1]
#       ]
#     end
#   end

#   context '複数マスブロック' do
#     before do
#       @td = TetrisData.new 6, 6
#       @block = Block.new 2, 1, [[0, -1], [0, 1], [1, 1]], 4
#       @block_d = Block.new 1, 2
#     end

#     it '操作なしでの、配置位置の確認' do
#       @td.set_block @block
#       @td.image_table.should == [
#         [1, 1, 1, 1, 1, 1, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [2, 2, 2, 0, 0, 0, 1],
#         [0, 0, 2, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [1, 1, 1, 1, 1, 1, 1]
#       ]
#     end

#     it '回転しない場合の複数マス相対座標' do
#       @td.calc_rotate_sp(@block.sp, 0).should ==
#         [[0, -1], [0, 1], [1, 1]]
#     end

#     it '1回転後の複数マス相対座標' do
#       @td.calc_rotate_sp(@block.sp, 1).should ==
#         [[1, 0], [-1, 0], [-1, 1]]
#     end
    
#     it '2回転後の複数マス相対座標' do
#       @td.calc_rotate_sp(@block.sp, 2).should ==
#         [[0, 1], [0, -1], [-1, -1]]
#     end

#     it '1回転' do
#       @td.set_block @block
#       @td.rotate_block @block
#       @td.image_table.should == [
#         [1, 1, 1, 1, 1, 1, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 2, 2, 0, 0, 0, 1],
#         [0, 2, 0, 0, 0, 0, 1],
#         [0, 2, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [1, 1, 1, 1, 1, 1, 1]
#       ]
#     end

#     it '1回転 左に2マス移動(2回目の移動は壁に当たって動けない)' do
#       @td.set_block @block
#       @td.rotate_block @block
#       2.times do
#         @td.left_block @block
#       end
#       @td.image_table.should == [
#         [1, 1, 1, 1, 1, 1, 1],
#         [0, 2, 2, 0, 0, 0, 1],
#         [0, 2, 0, 0, 0, 0, 1],
#         [0, 2, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [1, 1, 1, 1, 1, 1, 1]
#       ]
#     end

#     it '2回転' do
#       @td.set_block @block
#       2.times do
#         @td.rotate_block @block
#       end

#       @td.image_table.should == [
#         [1, 1, 1, 1, 1, 1, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [2, 0, 0, 0, 0, 0, 1],
#         [2, 2, 2, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [1, 1, 1, 1, 1, 1, 1]
#       ]
#     end

#     it '4回転' do
#       @td.set_block @block
#       4.times do
#         @td.rotate_block @block
#       end

#       @td.image_table.should == [
#         [1, 1, 1, 1, 1, 1, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [2, 2, 2, 0, 0, 0, 1],
#         [0, 0, 2, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [1, 1, 1, 1, 1, 1, 1]
#       ]
#     end

#     it '他のブロックが邪魔で回転出来ない' do
#       @td.set_block @block
#       @td.set_block @block_d
#       @td.rotate_block @block

#       @td.image_table.should == [
#         [1, 1, 1, 1, 1, 1, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 2, 0, 0, 0, 1],
#         [2, 2, 2, 0, 0, 0, 1],
#         [0, 0, 2, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [1, 1, 1, 1, 1, 1, 1]
#       ]
      
#     end

#   end
  
#   context '複数マスブロックの右移動' do
#     before do
#       @td = TetrisData.new 6, 6
#       @block = Block.new 2, 1, [[0, -1], [0, 1], [1, 1]]
#       @td.set_block @block
#       @td.right_block @block
#     end

#     it do
#       @td.image_table.should == [
#         [1, 1, 1, 1, 1, 1, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [2, 2, 2, 0, 0, 0, 1],
#         [0, 0, 2, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [1, 1, 1, 1, 1, 1, 1]
#       ]
#     end
#   end

#   context '複数マスブロックの右移動(不可)' do
#     before do
#       @td = TetrisData.new 6, 6
#       @block = Block.new 4, 1, [[0, -1], [0, 1], [1, 1]]
#       @td.set_block @block
#       @td.right_block @block
#     end

#     it do
#       @td.image_table.should == [
#         [1, 1, 1, 1, 1, 1, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [2, 2, 2, 0, 0, 0, 1],
#         [0, 0, 2, 0, 0, 0, 1],
#         [1, 1, 1, 1, 1, 1, 1]
#       ]
#     end
#   end

#   context '複数マスブロックの左移動' do
#     before do
#       @td = TetrisData.new 6, 6
#       @block = Block.new 2, 1, [[0, -1], [0, 1], [1, 1]]
#       @td.set_block @block
#       @td.left_block @block
#     end

#     it do
#       @td.image_table.should == [
#         [1, 1, 1, 1, 1, 1, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [2, 2, 2, 0, 0, 0, 1],
#         [0, 0, 2, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [1, 1, 1, 1, 1, 1, 1]
#       ]
#     end
#   end

#   context '複数マスブロックの左移動(不可)' do
#     before do
#       @td = TetrisData.new 6, 6
#       @block = Block.new 0, 1, [[0, -1], [0, 1], [1, 1]]
#       @td.set_block @block
#       @td.left_block @block
#     end

#     it do
#       @td.image_table.should == [
#         [1, 1, 1, 1, 1, 1, 1],
#         [2, 2, 2, 0, 0, 0, 1],
#         [0, 0, 2, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [1, 1, 1, 1, 1, 1, 1]
#       ]
#     end
#   end
#   context '複数マスブロックの下移動' do
#     before do
#       @td = TetrisData.new 6, 6
#       @block = Block.new 2, 1, [[0, -1], [0, 1], [1, 1]]
#       @td.set_block @block
#     end

#     it do
#       @td.down_block(@block).should be_true
#       @td.image_table.should == [
#         [1, 1, 1, 1, 1, 1, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 2, 2, 2, 0, 0, 1],
#         [0, 0, 0, 2, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [1, 1, 1, 1, 1, 1, 1]
#       ]
#     end
#   end

#   context '複数マスブロックの下移動(不可)' do
#     before do
#       @td = TetrisData.new 6, 6
#       @block = Block.new 2, 4, [[0, -1], [0, 1], [1, 1]]
#       @td.set_block @block
#     end

#     it do
#       @td.down_block(@block).should be_false
#       @td.image_table.should == [
#         [1, 1, 1, 1, 1, 1, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 2, 2, 2, 1],
#         [0, 0, 0, 0, 0, 2, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [1, 1, 1, 1, 1, 1, 1]
#       ]
#     end
#   end
#   context '複数マスブロックの上移動' do
#     before do
#       @td = TetrisData.new 6, 6
#       @block = Block.new 2, 2, [[0, -1], [0, 1], [1, 1]]
#       @td.set_block @block
#       @td.up_block @block
#     end

#     it do
#       @td.image_table.should == [
#         [1, 1, 1, 1, 1, 1, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [2, 2, 2, 0, 0, 0, 1],
#         [0, 0, 2, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [1, 1, 1, 1, 1, 1, 1]
#       ]
#     end
#   end

#   context '複数マスブロックの上移動(不可)' do
#     before do
#       @td = TetrisData.new 6, 6
#       @block = Block.new 1, 1, [[0, -1], [0, 1], [1, 1]]
#       @td.set_block @block
#       @td.up_block @block
#     end

#     it do
#       @td.image_table.should == [
#         [1, 1, 1, 1, 1, 1, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [2, 2, 2, 0, 0, 0, 1],
#         [0, 0, 2, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [1, 1, 1, 1, 1, 1, 1]
#       ]
#     end
#   end
#   context '複数マスブロックの消去' do
#     before do
#       @td = TetrisData.new 6, 6
#       @block1 = Block.new 2, 1, [[0, -1], [0, 1], [1, 1]]
#       @block2 = Block.new 3, 4, [[0, -1], [0, 1], [1, 1]]
#       @td.set_block @block1
#       @td.set_block @block2
#       @td.remove_block @block1
#     end

#     it do
#       @td.image_table.should == [
#         [1, 1, 1, 1, 1, 1, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [0, 0, 0, 2, 2, 2, 1],
#         [0, 0, 0, 0, 0, 2, 1],
#         [0, 0, 0, 0, 0, 0, 1],
#         [1, 1, 1, 1, 1, 1, 1]
#       ]
#     end
#   end

#   context 'ブロックの消滅処理' do
#     before do
#       @td = TetrisData.new 3, 3
#       @block1 = Block.new 1, 2, [[1, 0], [-1, 0]]
#       @block2 = Block.new 1, 1, [[1, 0], [-1, 0]]
#       @block3 = Block.new 0, 0

#       @block4 = Block.new 1, 0, [[1, 0], [-1, 0]]
#       @block5 = Block.new 0, 1
#     end

#     it '指定行の消滅処理 消滅なし 呼び出し結果がfalse' do
#       @td.set_block @block3
#       @td.vanish_line(0).should be_false
#       @td.image_table.should == [
#         [1, 1, 1, 1],
#         [2, 0, 0, 1],
#         [0, 0, 0, 1],
#         [0, 0, 0, 1],
#         [1, 1, 1, 1]
#       ]
#     end
    
#     it '指定行の消滅処理 消滅する 呼び出し結果がtrue' do
#       @td.set_block @block1
#       @td.vanish_line(2).should be_true
#       @td.image_table.should == [
#         [1, 1, 1, 1],
#         [0, 0, 0, 1],
#         [0, 0, 0, 1],
#         [0, 0, 0, 1],
#         [1, 1, 1, 1]
#       ]
#     end

#     it '指定行より上の行が、一段したにずれる' do
#       @td.set_block @block2
#       @td.set_block @block3
#       @td.down_line(2)
#       @td.image_table.should == [
#         [1, 1, 1, 1],
#         [0, 2, 2, 1],
#         [0, 0, 2, 1],
#         [0, 0, 2, 1],
#         [1, 1, 1, 1]
#       ]
#     end

#     it '行の消滅処理と、ブロックのずれテスト' do
#       @td.set_block @block1
#       @td.set_block @block4
#       @td.set_block @block5
#       @td.vanish_down_proc
#       @td.image_table.should == [
#         [1, 1, 1, 1],
#         [0, 0, 2, 1],
#         [0, 0, 0, 1],
#         [0, 0, 0, 1],
#         [1, 1, 1, 1]
#       ]
#     end
#   end
# end

