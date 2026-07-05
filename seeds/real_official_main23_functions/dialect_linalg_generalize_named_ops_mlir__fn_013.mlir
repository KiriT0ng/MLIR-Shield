func.func @generalize_batch_reduce_gemm_bf16(%lhs: memref<7x8x9xbf16>, %rhs: memref<7x9x8xbf16>, %out: memref<8x8xf32>) {
  linalg.batch_reduce_matmul ins(%lhs, %rhs: memref<7x8x9xbf16>, memref<7x9x8xbf16>)
                             outs(%out: memref<8x8xf32>)
  return
}
