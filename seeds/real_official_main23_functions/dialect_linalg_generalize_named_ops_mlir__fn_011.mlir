func.func @generalize_batch_vecmat(%lhs : memref<?x?xi8>, %rhs: memref<?x?x?xi8>,  %out: memref<?x?xf32>) {
  linalg.batch_vecmat ins(%lhs, %rhs: memref<?x?xi8>, memref<?x?x?xi8>)
                     outs(%out: memref<?x?xf32>)
  return
}
