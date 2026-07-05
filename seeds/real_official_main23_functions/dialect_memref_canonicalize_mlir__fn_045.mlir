func.func @no_fold_subview_with_non_zero_offset(%arg0 : memref<20x42xf32>) -> memref<20x41xf32, strided<[42, 1], offset: 1>> {
  %0 = memref.subview %arg0[0, 1] [20, 41] [1, 1] : memref<20x42xf32> to memref<20x41xf32, strided<[42, 1], offset: 1>>
  return %0 : memref<20x41xf32, strided<[42, 1], offset: 1>>
}
