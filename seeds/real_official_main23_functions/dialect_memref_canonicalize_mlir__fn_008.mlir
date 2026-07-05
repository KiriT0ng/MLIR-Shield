func.func @subview_negative_stride2(%arg0 : memref<7xf32>) -> memref<?xf32, strided<[?], offset: ?>>
{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant -1 : index
  %1 = memref.dim %arg0, %c0 : memref<7xf32>
  %2 = arith.addi %1, %c1 : index
  %3 = memref.subview %arg0[%2] [%1] [%c1] : memref<7xf32> to memref<?xf32, strided<[?], offset: ?>>
  return %3 : memref<?xf32, strided<[?], offset: ?>>
}
