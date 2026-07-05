func.func @subview_of_strides_memcast(%arg : memref<1x1x?xf32, strided<[35, 7, 1], offset: ?>>) -> memref<1x4xf32, strided<[?, ?], offset: ?>> {
  %0 = memref.cast %arg : memref<1x1x?xf32, strided<[35, 7, 1], offset: ?>> to memref<1x1x?xf32, strided<[?, ?, ?], offset: ?>>
  %1 = memref.subview %0[0, 0, 0] [1, 1, 4] [1, 1, 1] : memref<1x1x?xf32, strided<[?, ?, ?], offset: ?>> to memref<1x4xf32, strided<[?, ?], offset: ?>>
  return %1 : memref<1x4xf32, strided<[?, ?], offset: ?>>
}
