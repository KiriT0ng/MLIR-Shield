func.func @negative_store_to_load_tensor_broadcast_out_of_bounds(%arg0 : tensor<?x?xf32>,
  %v0 : vector<4x2xf32>) -> vector<4x2x6xf32> {
  %c0 = arith.constant 0 : index
  %cf0 = arith.constant 0.0 : f32
  %w0 = vector.transfer_write %v0, %arg0[%c0, %c0] :
    vector<4x2xf32>, tensor<?x?xf32>
  %0 = vector.transfer_read %w0[%c0, %c0], %cf0 {in_bounds = [true, true, true],
  permutation_map = affine_map<(d0, d1) -> (d0, d1, 0)>} :
    tensor<?x?xf32>, vector<4x2x6xf32>
  return %0 : vector<4x2x6xf32>
}
