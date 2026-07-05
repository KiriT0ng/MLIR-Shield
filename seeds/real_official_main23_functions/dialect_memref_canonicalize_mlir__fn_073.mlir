func.func @reinterpret_cast_no_fold_with_all_negative_size_and_offset(%arg0: memref<2x3xf32>) -> memref<?x?xf32, strided<[?, ?], offset: ?>> {
  %neg = arith.constant -1 : index
  %output = memref.reinterpret_cast %arg0 to
            offset: [%neg], sizes: [%neg, %neg], strides: [2, 1]
            : memref<2x3xf32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
  return %output : memref<?x?xf32, strided<[?, ?], offset: ?>>
}
