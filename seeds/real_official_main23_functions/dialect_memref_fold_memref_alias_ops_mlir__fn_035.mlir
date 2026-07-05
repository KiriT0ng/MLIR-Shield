func.func @fold_vector_transfer_read_expand_shape_non_identity_non_contiguous(
  %arg0 : memref<32x32xf32>, %arg1 : index, %arg2 : index) -> vector<8x8xf32> {
  %c0 = arith.constant 0 : index
  %pad = ub.poison : f32
  %0 = memref.expand_shape %arg0 [[0, 1], [2, 3]] output_shape [4, 8, 4, 8] : memref<32x32xf32> into memref<4x8x4x8xf32>
  %1 = vector.transfer_read %0[%arg1, %c0, %arg2, %c0], %pad {in_bounds = [true, true], permutation_map = affine_map<(d0, d1, d2, d3) -> (d0, d3)>} : memref<4x8x4x8xf32>, vector<8x8xf32>
  return %1 : vector<8x8xf32>
}
