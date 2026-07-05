func.func @fold_gpu_subgroup_mma_load_matrix_2d(%arg0 : memref<128x128xf32>, %arg1 : index, %arg2 : index, %arg3 : index, %arg4 : index, %matrix: !gpu.mma_matrix<16x16xf16, "COp">) {
  %subview = memref.subview %arg0[%arg1, %arg2][64, 32][2, 1] : memref<128x128xf32> to memref<64x32xf32, strided<[256, 1], offset: ?>>
  gpu.subgroup_mma_store_matrix %matrix, %subview[%arg3, %arg4] {leadDimension = 32 : index} :  !gpu.mma_matrix<16x16xf16, "COp">, memref<64x32xf32, strided<[256, 1], offset: ?>>
  return
}
