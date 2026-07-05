func.func @fold_vector_transfer_read_with_perm_map(
  %arg0 : memref<32xf32>, %arg1 : index) -> vector<4x4xf32> {
  %c0 = arith.constant 0 : index
  %pad = ub.poison : f32
  %0 = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
  %1 = vector.transfer_read %0[%arg1, %c0], %pad { permutation_map = affine_map<(d0, d1) -> (d1, d0)>, in_bounds = [true, true]} : memref<4x8xf32>, vector<4x4xf32>
  return %1 : vector<4x4xf32>
}
