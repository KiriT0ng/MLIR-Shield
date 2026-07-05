func.func @fold_gpu_subgroup_mma_load_matrix_1d(%src: memref<?xvector<4xf32>>, %offset: index, %i: index) -> !gpu.mma_matrix<16x16xf16, "COp"> {
  %subview = memref.subview %src[%offset] [81920] [1] : memref<?xvector<4xf32>> to memref<81920xvector<4xf32>, strided<[1], offset: ?>>
  %matrix = gpu.subgroup_mma_load_matrix %subview[%i] {leadDimension = 160 : index} : memref<81920xvector<4xf32>, strided<[1], offset: ?>> -> !gpu.mma_matrix<16x16xf16, "COp">
  return %matrix: !gpu.mma_matrix<16x16xf16, "COp">
}
