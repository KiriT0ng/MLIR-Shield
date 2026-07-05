func.func @subview_rank_reduction(%arg0: memref<1x384x384xf32>, %idx: index)
    -> memref<?x?xf32, strided<[384, 1], offset: ?>> {
  %c1 = arith.constant 1 : index
  %0 = memref.subview %arg0[0, %idx, %idx] [1, %c1, %idx] [1, 1, 1]
      : memref<1x384x384xf32> to memref<?x?xf32, strided<[384, 1], offset: ?>>
  return %0 : memref<?x?xf32, strided<[384, 1], offset: ?>>
}
