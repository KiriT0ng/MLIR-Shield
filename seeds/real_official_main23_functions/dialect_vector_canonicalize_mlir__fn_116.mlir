func.func @dead_transfer_op(%arg0 : tensor<4x4xf32>, %arg1 : memref<4x4xf32>,
                       %v0 : vector<1x4xf32>) {
  %c0 = arith.constant 0 : index
  %cf0 = arith.constant 0.0 : f32
  %r = vector.transfer_read %arg1[%c0, %c0], %cf0 :
    memref<4x4xf32>, vector<1x4xf32>
  %w = vector.transfer_write %v0, %arg0[%c0, %c0] :
    vector<1x4xf32>, tensor<4x4xf32>
  return
}
