func.func @no_fold_pack_cast_inner_tile_inlined_mismatch(%arg0: tensor<8x3xi32>,
    %dest: tensor<?x3x?x1xi32>) -> tensor<?x3x?x1xi32> {
  %c0 = arith.constant 0 : i32
  %c256 = arith.constant 256 : index
  %cast = tensor.cast %arg0 : tensor<8x3xi32> to tensor<?x?xi32>
  %pack = linalg.pack %cast
    padding_value(%c0 : i32)
    inner_dims_pos = [0, 1]
    inner_tiles = [%c256, 1]
    into %dest : tensor<?x?xi32> -> tensor<?x3x?x1xi32>
  return %pack : tensor<?x3x?x1xi32>
}
