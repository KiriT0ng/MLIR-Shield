func.func @fold_static_stride_subview_with_transfer_write(%arg0 : memref<12x32xf32>, %arg1 : index, %arg2 : index, %arg3 : index, %arg4 : index, %arg5: index, %arg6 : index, %arg7 : vector<4xf32>) {
  %0 = memref.subview %arg0[%arg1, %arg2][4, 4][%arg5, %arg6] :
    memref<12x32xf32> to memref<4x4xf32, strided<[?, ?], offset: ?>>
  vector.transfer_write %arg7, %0[%arg3, %arg4] {in_bounds = [true]} : vector<4xf32>, memref<4x4xf32, strided<[?, ?], offset: ?>>
  return
}
