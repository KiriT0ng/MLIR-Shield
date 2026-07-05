func.func @fold_vector_transfer_masks(%A: memref<?x?xf32>) -> (vector<4x8xf32>, vector<4x[4]xf32>) {
  %c0 = arith.constant 0 : index
  %f0 = arith.constant 0.0 : f32

  %mask = vector.constant_mask [8, 4] : vector<8x4xi1>

  %arith_all_true_mask = arith.constant dense<true> : vector<4x[4]xi1>

  %1 = vector.transfer_read %A[%c0, %c0], %f0, %mask
      {permutation_map = affine_map<(d0, d1) -> (d1, d0)>} : memref<?x?xf32>, vector<4x8xf32>

  vector.transfer_write %1, %A[%c0, %c0], %mask
      {permutation_map = affine_map<(d0, d1) -> (d1, d0)>} : vector<4x8xf32>, memref<?x?xf32>

  %2 = vector.transfer_read %A[%c0, %c0], %f0, %arith_all_true_mask : memref<?x?xf32>, vector<4x[4]xf32>

  vector.transfer_write %2, %A[%c0, %c0], %arith_all_true_mask : vector<4x[4]xf32>, memref<?x?xf32>

  return %1, %2 : vector<4x8xf32>, vector<4x[4]xf32>
}
