func.func @fold_memref_expand_static_to_dynamic_layout(%arg0 : memref<8x4xf32>) -> memref<8x1x4xf32> {
  %0 = memref.cast %arg0 : memref<8x4xf32> to memref<8x4xf32, strided<[?, ?], offset: ?>>
  %1 = memref.expand_shape %0 [[0, 1], [2]] output_shape [8, 1, 4]
      : memref<8x4xf32, strided<[?, ?], offset: ?>> into memref<8x1x4xf32, strided<[?,?,?], offset: ?>>
  %2 = memref.cast %1 : memref<8x1x4xf32, strided<[?,?,?], offset: ?>> to memref<8x1x4xf32>
  return %2 : memref<8x1x4xf32>
}
