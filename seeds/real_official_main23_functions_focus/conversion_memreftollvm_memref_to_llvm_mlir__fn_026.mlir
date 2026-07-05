func.func @memref_copy_noncontiguous(%in: memref<16x2xi32>, %offset: index) {
  %buf = memref.alloc() : memref<2x1xi32>
  %sub = memref.subview %in[%offset, 0] [2, 1] [1, 1] : memref<16x2xi32> to memref<2x1xi32, strided<[2, 1], offset: ?>>
  memref.copy %sub, %buf : memref<2x1xi32, strided<[2, 1], offset: ?>> to memref<2x1xi32>
  return
}
