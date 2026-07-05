func.func @negative_store_after_load_tensor(%arg0 : tensor<4x4xf32>) -> tensor<4x4xf32> {
  %c1 = arith.constant 1 : index
  %c0 = arith.constant 0 : index
  %cf0 = arith.constant 0.0 : f32
  %0 = vector.transfer_read %arg0[%c1, %c0], %cf0 :
    tensor<4x4xf32>, vector<1x4xf32>
  %w0 = vector.transfer_write %0, %arg0[%c0, %c0] :
    vector<1x4xf32>, tensor<4x4xf32>
  return %w0 : tensor<4x4xf32>
}
