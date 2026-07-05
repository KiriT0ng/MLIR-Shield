func.func @fold_static_stride_subview_with_memref_expand_shape_with_constant_access_index(%arg0: memref<1024x1024xf32>, %arg1: memref<1xf32>, %arg2: index) -> f32 {
  %0 = memref.expand_shape %arg0 [[0, 1], [2, 3]] output_shape [1, 1024, 1024, 1] : memref<1024x1024xf32> into memref<1x1024x1024x1xf32>
  %cst = arith.constant 0 : index
  affine.for %arg3 = 0 to 1 {
    affine.for %arg4 = 0 to 1024 {
      affine.for %arg5 = 0 to 1020 {
        affine.for %arg6 = 0 to 1 {
          %1 = memref.load %0[%arg3, %cst, %arg5, %arg6] : memref<1x1024x1024x1xf32>
          memref.store %1, %arg1[%arg2] : memref<1xf32>
        }
      }
    }
  }
  %2 = memref.load %arg1[%arg2] : memref<1xf32>
  return %2 : f32
}
