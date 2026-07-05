func.func @no_fold_invalid_dynamic_slice(%arg0: memref<10xf32>) -> memref<?xf32, strided<[1], offset: 2>> {
  %c11 = arith.constant 11 : index
  %0 = memref.subview %arg0 [2][%c11][1] : memref<10xf32> to memref<?xf32, strided<[1], offset: 2>>
  func.return %0 : memref<?xf32, strided<[1], offset: 2>>
}
