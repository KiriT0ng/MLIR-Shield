func.func @ind_memref_layout_cast_chain_700(%arg0: memref<2x3xf32>, %i: index, %j: index) -> f32 {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %cast = memref.cast %arg0 : memref<2x3xf32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
  %sub = memref.subview %cast[%c0, %c0][2, 3][%c1, %c1] : memref<?x?xf32, strided<[?, ?], offset: ?>> to memref<2x3xf32, strided<[?, ?], offset: ?>>
  %re = memref.reinterpret_cast %sub to offset: [0], sizes: [2, 3], strides: [3, 1] : memref<2x3xf32, strided<[?, ?], offset: ?>> to memref<2x3xf32, strided<[3, 1], offset: 0>>
  %v = memref.load %re[%i, %j] : memref<2x3xf32, strided<[3, 1], offset: 0>>
  return %v : f32
}
