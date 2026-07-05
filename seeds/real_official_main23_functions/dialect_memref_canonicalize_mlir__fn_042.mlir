func.func @reduced_memref(%arg0: memref<2x5x7x1xf32>, %arg1 :index)
    -> memref<1x4x1xf32, strided<[35, 7, 1], offset: ?>> {
  %c0 = arith.constant 0 : index
  %c5 = arith.constant 5 : index
  %c4 = arith.constant 4 : index
  %c2 = arith.constant 2 : index
  %c1 = arith.constant 1 : index
  %0 = memref.subview %arg0[%arg1, %arg1, %arg1, 0] [%c1, %c4, %c1, 1] [1, 1, 1, 1]
      : memref<2x5x7x1xf32> to memref<?x?x?xf32, strided<[35, 7, 1], offset: ?>>
  %1 = memref.cast %0
      : memref<?x?x?xf32, strided<[35, 7, 1], offset: ?>> to
        memref<1x4x1xf32, strided<[35, 7, 1], offset: ?>>
  return %1 : memref<1x4x1xf32, strided<[35, 7, 1], offset: ?>>
}
