func.func @negative_subview_of_static_full_size(%arg0:  memref<16x4xf32,  strided<[4, 1], offset: ?>>, %idx: index) -> memref<16x4xf32,  strided<[4, 1], offset: ?>> {
  %0 = memref.subview %arg0[%idx, 0][16, 4][1, 1] : memref<16x4xf32,  strided<[4, 1], offset: ?>> to memref<16x4xf32,  strided<[4, 1], offset: ?>>
  return %0 : memref<16x4xf32,  strided<[4, 1], offset: ?>>
}
