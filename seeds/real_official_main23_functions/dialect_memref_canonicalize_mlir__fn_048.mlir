func.func @no_fold_dynamic_no_op_subview(%arg0 : memref<?x?xf32>) -> memref<?x?xf32, strided<[?, 1]>> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0 = memref.dim %arg0, %c0 : memref<?x?xf32>
  %1 = memref.dim %arg0, %c1 : memref<?x?xf32>
  %2 = memref.subview %arg0[0, 0] [%0, %1] [1, 1] : memref<?x?xf32> to memref<?x?xf32, strided<[?, 1]>>
  return %2 : memref<?x?xf32, strided<[?, 1]>>
}
