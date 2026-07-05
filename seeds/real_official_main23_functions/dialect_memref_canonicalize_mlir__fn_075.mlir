func.func @canonicalize_rank_reduced_subview(%arg0 : memref<8x?xf32>,
    %arg1 : index) -> memref<?xf32, strided<[?], offset: ?>> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0 = memref.subview %arg0[%c0, %c0] [1, %arg1] [%c1, %c1] : memref<8x?xf32> to memref<?xf32, strided<[?], offset: ?>>
  return %0 :  memref<?xf32, strided<[?], offset: ?>>
}
