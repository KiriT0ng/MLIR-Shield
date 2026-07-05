func.func @no_fold_subview_zero_stride(%arg0 : memref<10xf32>) -> memref<1xf32, strided<[?], offset: 1>> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %1 = memref.subview %arg0[1] [1] [%c0] : memref<10xf32> to memref<1xf32, strided<[?], offset: 1>>
  return %1 : memref<1xf32, strided<[?], offset: 1>>
}
