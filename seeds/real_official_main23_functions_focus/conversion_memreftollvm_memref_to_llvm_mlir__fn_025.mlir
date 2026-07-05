func.func @memref_copy_0d_offset(%in: memref<2xi32>) {
  %buf = memref.alloc() : memref<i32>
  %sub = memref.subview %in[1] [1] [1] : memref<2xi32> to memref<1xi32, strided<[1], offset: 1>>
  %scalar = memref.collapse_shape %sub [] : memref<1xi32, strided<[1], offset: 1>> into memref<i32, strided<[], offset: 1>>
  memref.copy %scalar, %buf : memref<i32, strided<[], offset: 1>> to memref<i32>
  return
}
