func.func @fold_vector_transfer_read_rank_mismatch(
  %arg0 : memref<32xf32>, %arg1 : index) -> vector<4x4xf32> {
  %c0 = arith.constant 0 : index
  %pad = ub.poison : f32
  %0 = memref.expand_shape %arg0 [[0, 1, 2]] output_shape [2, 4, 4] : memref<32xf32> into memref<2x4x4xf32>
  %1 = vector.transfer_read %0[%arg1, %c0, %c0], %pad {in_bounds = [true, true]} : memref<2x4x4xf32>, vector<4x4xf32>
  return %1 : vector<4x4xf32>
}
