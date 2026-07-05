func.func @fold_unpack_cast_inner_tile_inlined_mismatch(%arg0: tensor<1x3x8x1xi32>) -> tensor<7x3xi32> {
  %c256 = arith.constant 256 : index
  %1 = tensor.empty() : tensor<7x3xi32>
  %cast = tensor.cast %arg0 : tensor<1x3x8x1xi32> to tensor<?x3x?x1xi32>
  %unpack = linalg.unpack %cast inner_dims_pos = [0, 1] inner_tiles = [%c256, 1] into %1 : tensor<?x3x?x1xi32> -> tensor<7x3xi32>
  return %unpack : tensor<7x3xi32>
}
