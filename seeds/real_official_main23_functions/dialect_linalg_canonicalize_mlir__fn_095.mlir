func.func @fold_unpack_cast_inner_tile_dynamic_arg(%arg0: tensor<1x3x8x1xi32>, %arg1: index) -> tensor<7x3xi32> {
  %0 = tensor.empty() : tensor<7x3xi32>
  %cast = tensor.cast %arg0 : tensor<1x3x8x1xi32> to tensor<?x3x?x1xi32>
  %unpack = linalg.unpack %cast inner_dims_pos = [0, 1] inner_tiles = [%arg1, 1] into %0 : tensor<?x3x?x1xi32> -> tensor<7x3xi32>
  return %unpack : tensor<7x3xi32>
}
