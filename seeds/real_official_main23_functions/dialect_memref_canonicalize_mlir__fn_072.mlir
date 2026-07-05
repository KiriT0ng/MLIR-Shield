func.func @reinterpret_cast_with_negative_size_and_offset(%arg0: memref<2x3xf32>) -> memref<?x?xf32, strided<[?, ?], offset: ?>> {
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %neg = arith.constant -1 : index
  %output = memref.reinterpret_cast %arg0 to
            offset: [%neg], sizes: [%c1, %neg], strides: [%c2, %c1]
            : memref<2x3xf32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
  return %output : memref<?x?xf32, strided<[?, ?], offset: ?>>
}
