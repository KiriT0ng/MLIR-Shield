func.func @negative_store_to_load_tensor_no_actual_broadcast(%arg0 : tensor<?x?xf32>,
  %v0 : vector<4x2xf32>) -> vector<4x2xf32> {
  %c0 = arith.constant 0 : index
  %cf0 = arith.constant 0.0 : f32
  %w0 = vector.transfer_write %v0, %arg0[%c0, %c0] :
    vector<4x2xf32>, tensor<?x?xf32>
  %0 = vector.transfer_read %w0[%c0, %c0], %cf0 {in_bounds = [true, true]} :
    tensor<?x?xf32>, vector<4x2xf32>
  return %0 : vector<4x2xf32>
}
