func.func @batch_reduce_gemm(%lhs: memref<7x8x9xf32>, %rhs: memref<7x9x8xf32>, %out: memref<8x8xf32>) {
  linalg.batch_reduce_matmul ins(%lhs, %rhs: memref<7x8x9xf32>, memref<7x9x8xf32>)
                             outs(%out: memref<8x8xf32>)
  return
}
