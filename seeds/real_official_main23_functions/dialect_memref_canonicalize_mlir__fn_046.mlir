func.func @no_fold_subview_with_non_unit_stride(%arg0 : memref<20x42xf32>) -> memref<20x5xf32, strided<[42, 2]>> {
  %0 = memref.subview %arg0[0, 0] [20, 5] [1, 2] : memref<20x42xf32> to memref<20x5xf32, strided<[42, 2]>>
  return %0 : memref<20x5xf32, strided<[42, 2]>>
}
