func.func @store_to_load_tensor_broadcast_scalable(%arg0 : tensor<?xf32>,
  %v0 : vector<[4]xf32>) -> vector<6x[4]xf32> {
  %c0 = arith.constant 0 : index
  %cf0 = arith.constant 0.0 : f32
  %w0 = vector.transfer_write %v0, %arg0[%c0] {in_bounds = [true]} :
    vector<[4]xf32>, tensor<?xf32>
  %0 = vector.transfer_read %w0[%c0], %cf0 {in_bounds = [true, true],
  permutation_map = affine_map<(d0) -> (0, d0)>} :
    tensor<?xf32>, vector<6x[4]xf32>
  return %0 : vector<6x[4]xf32>
}
