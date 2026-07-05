func.func @fold_gpu_subgroup_mma_store_matrix_1d(%dst: memref<?xvector<4xf32>>, %offset: index, %i: index, %matrix: !gpu.mma_matrix<16x16xf16, "COp">) {
  %subview = memref.subview %dst[%offset] [81920] [1] : memref<?xvector<4xf32>> to memref<81920xvector<4xf32>, strided<[1], offset: ?>>
  gpu.subgroup_mma_store_matrix %matrix, %subview[%i] {leadDimension = 160 : index} : !gpu.mma_matrix<16x16xf16, "COp">, memref<81920xvector<4xf32>, strided<[1], offset: ?>>
  return
}
