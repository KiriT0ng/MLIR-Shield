func.func @fold_gpu_subgroup_mma_load_matrix_2d(%arg0 : memref<128x128xf32>, %arg1 : index, %arg2 : index, %arg3 : index, %arg4 : index) -> !gpu.mma_matrix<16x16xf16, "COp"> {
  %subview = memref.subview %arg0[%arg1, %arg2][64, 32][2, 1] : memref<128x128xf32> to memref<64x32xf32, strided<[256, 1], offset: ?>>
  %matrix = gpu.subgroup_mma_load_matrix %subview[%arg3, %arg4] {leadDimension = 32 : index} : memref<64x32xf32, strided<[256, 1], offset: ?>> -> !gpu.mma_matrix<16x16xf16, "COp">
  return %matrix : !gpu.mma_matrix<16x16xf16, "COp">
}
