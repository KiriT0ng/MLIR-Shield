func.func @reinterpret_constant_fold(%arg0: memref<f32>) -> memref<?x?xf32, strided<[?, ?], offset: ?>> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c100 = arith.constant 100 : index
  %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%c0], sizes: [%c100, %c100], strides: [%c100, %c1] : memref<f32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
  return %reinterpret_cast : memref<?x?xf32, strided<[?, ?], offset: ?>>
}
