func.func @fold_collapse_shape_transfer_read(
    %arg0 : memref<4x4x8xf32>, %arg1 : index) -> vector<8xf32> {
  %c0 = arith.constant 0 : index
  %pad = ub.poison : f32
  %0 = memref.collapse_shape %arg0 [[0, 1], [2]] : memref<4x4x8xf32> into memref<16x8xf32>
  %1 = vector.transfer_read %0[%arg1, %c0], %pad {in_bounds = [true]} : memref<16x8xf32>, vector<8xf32>
  return %1 : vector<8xf32>
}
