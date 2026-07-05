func.func @reinterpret_cast_fold_negative_stride(%arg0: memref<2x3xf32>) -> memref<?x?xf32, strided<[?, ?], offset: ?>> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %neg = arith.constant -1 : index
  %output = memref.reinterpret_cast %arg0 to
            offset: [%c0], sizes: [%c1, %c2], strides: [%neg, %c1]
            : memref<2x3xf32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
  return %output : memref<?x?xf32, strided<[?, ?], offset: ?>>
}
