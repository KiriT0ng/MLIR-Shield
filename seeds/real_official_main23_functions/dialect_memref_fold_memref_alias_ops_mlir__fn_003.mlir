func.func @fold_dynamic_stride_subview_with_store(%arg0 : memref<12x32xf32>, %arg1 : index, %arg2 : index, %arg3 : index, %arg4 : index, %arg5 : index, %arg6 : index, %arg7 : f32) {
  %0 = memref.subview %arg0[%arg1, %arg2][4, 4][%arg5, %arg6] :
    memref<12x32xf32> to memref<4x4xf32, strided<[?, ?], offset: ?>>
  memref.store %arg7, %0[%arg3, %arg4] : memref<4x4xf32, strided<[?, ?], offset: ?>>
  return
}
