func.func @no_fold_subview_negative_size(%input: memref<4x1024xf32>) -> memref<?x256xf32, strided<[1024, 1], offset: 2304>> {
  %cst = arith.constant -13 : index
  %0 = memref.subview %input[2, 256] [%cst, 256] [1, 1] : memref<4x1024xf32> to memref<?x256xf32, strided<[1024, 1], offset: 2304>>
  return %0 : memref<?x256xf32, strided<[1024, 1], offset: 2304>>
}
