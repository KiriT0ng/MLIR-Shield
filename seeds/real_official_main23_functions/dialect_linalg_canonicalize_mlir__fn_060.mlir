func.func @negative_fold_pack_zero_tile(%A: tensor<7x16xi32>) -> tensor<1x16x?x1xi32> {
  %pad_val = arith.constant 123 : i32
  %tile_size = arith.constant 0 : index
  %empty = tensor.empty(%tile_size) : tensor<1x16x?x1xi32>
  %pack = linalg.pack %A
    padding_value(%pad_val : i32)
    inner_dims_pos = [0, 1]
    inner_tiles = [%tile_size, 1]
    into %empty : tensor<7x16xi32> -> tensor<1x16x?x1xi32>
  return %pack : tensor<1x16x?x1xi32>
}
