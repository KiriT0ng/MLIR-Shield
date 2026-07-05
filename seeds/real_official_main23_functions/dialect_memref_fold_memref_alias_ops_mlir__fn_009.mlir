func.func @subview_of_subview_no_unit_stride(%arg0: memref<8x8xf32, strided<[8, 1]>>) -> memref<2x2xf32, strided<[32, 4], offset: 27>> {
  %subview = memref.subview %arg0[1, 1] [4, 4] [2, 2] : memref<8x8xf32, strided<[8, 1]>> to memref<4x4xf32, strided<[16, 2], offset: 9>>
  %subview_0 = memref.subview %subview[1, 1] [2, 2] [2, 2] : memref<4x4xf32, strided<[16, 2], offset: 9>> to memref<2x2xf32, strided<[32, 4], offset: 27>>
  return %subview_0 : memref<2x2xf32, strided<[32, 4], offset: 27>>
}
