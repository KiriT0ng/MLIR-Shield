func.func @memref_copy_contiguous(%in: memref<16x4xi32>, %offset: index) {
  %buf = memref.alloc() : memref<1x2xi32>
  %sub = memref.subview %in[%offset, 0] [1, 2] [1, 1] : memref<16x4xi32> to memref<1x2xi32, strided<[4, 1], offset: ?>>
  memref.copy %sub, %buf : memref<1x2xi32, strided<[4, 1], offset: ?>> to memref<1x2xi32>
  // Skip the memref descriptor of the alloc.
  // Get the memref for the subview.
  return
}
