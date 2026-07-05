func.func @fold_rank_memref(%arg0 : memref<?x?xf32>) -> (index) {
  // Fold a rank into a constant
  %rank_0 = memref.rank %arg0 : memref<?x?xf32>

  return %rank_0 : index
}
