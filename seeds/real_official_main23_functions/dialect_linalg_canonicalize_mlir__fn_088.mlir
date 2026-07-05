func.func @fold_dst_style_ops_into_unpack(%arg0 : tensor<?x?x16x64xf32>, %init : tensor<?x?xf32>) -> tensor<?x?xf32> {
  %cst = arith.constant 0.0 : f32
  %fill = linalg.fill ins(%cst : f32) outs(%init : tensor<?x?xf32>) -> tensor<?x?xf32>
  %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [16, 64] into %fill : tensor<?x?x16x64xf32> -> tensor<?x?xf32>
  return %unpack : tensor<?x?xf32>
}
