func.func @fold_no_op_subview(%arg0 : memref<20x42xf32>) -> memref<20x42xf32, strided<[42, 1]>> {
  %0 = memref.subview %arg0[0, 0] [20, 42] [1, 1] : memref<20x42xf32> to memref<20x42xf32, strided<[42, 1]>>
  return %0 : memref<20x42xf32, strided<[42, 1]>>
}
