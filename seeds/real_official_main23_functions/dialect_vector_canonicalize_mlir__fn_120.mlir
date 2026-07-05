func.func @store_to_load_tensor(%arg0 : tensor<4x4xf32>,
  %v0 : vector<1x4xf32>, %v1 : vector<1x4xf32>) -> vector<1x4xf32> {
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %c0 = arith.constant 0 : index
  %cf0 = arith.constant 0.0 : f32
  %w0 = vector.transfer_write %v0, %arg0[%c1, %c0] {in_bounds = [true, true]} :
    vector<1x4xf32>, tensor<4x4xf32>
  %w1 = vector.transfer_write %v1, %w0[%c2, %c0] {in_bounds = [true, true]} :
    vector<1x4xf32>, tensor<4x4xf32>
  %0 = vector.transfer_read %w1[%c1, %c0], %cf0 {in_bounds = [true, true]} :
    tensor<4x4xf32>, vector<1x4xf32>
  return %0 : vector<1x4xf32>
}
