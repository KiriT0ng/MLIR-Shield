func.func @load_store_forwarding_rank_mismatch(%v0: vector<4x1x1xf32>, %arg0: tensor<4x4x4xf32>) -> (vector<1x100x4x5xf32>) {
  %c0 = arith.constant 0 : index
  %cf0 = arith.constant 0.0 : f32
  // d0 is explicitly written.
  %w0 = vector.transfer_write %v0, %arg0[%c0, %c0, %c0]
      {in_bounds = [true, true, true],
      permutation_map = affine_map<(d0, d1, d2) -> (d2, d1, d0)>} :
      vector<4x1x1xf32>, tensor<4x4x4xf32>
  // d0 is implicitly read (rank-reduction of unit dim).
  %r = vector.transfer_read %w0[%c0, %c0, %c0], %cf0
      {in_bounds = [true, true, true, true],
      permutation_map = affine_map<(d0, d1, d2) -> (d1, 0, d2, 0)>} :
      tensor<4x4x4xf32>, vector<1x100x4x5xf32>
  return %r : vector<1x100x4x5xf32>
}
