func.func @fold_static_stride_subview_with_load(%arg0 : memref<12x32xf32>, %arg1 : index, %arg2 : index, %arg3 : index, %arg4 : index) -> f32 {
  %0 = memref.subview %arg0[%arg1, %arg2][4, 4][2, 3] : memref<12x32xf32> to memref<4x4xf32, strided<[64, 3], offset: ?>>
  %1 = memref.load %0[%arg3, %arg4] : memref<4x4xf32, strided<[64, 3], offset: ?>>
  return %1 : f32
}
