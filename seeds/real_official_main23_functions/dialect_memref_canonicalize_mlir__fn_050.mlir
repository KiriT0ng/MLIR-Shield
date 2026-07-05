func.func @copy_of_cast(%m1: memref<?xf32>, %m2: memref<*xf32>) {
  %casted1 = memref.cast %m1 : memref<?xf32> to memref<?xf32, strided<[?], offset: ?>>
  %casted2 = memref.cast %m2 : memref<*xf32> to memref<?xf32, strided<[?], offset: ?>>
  memref.copy %casted1, %casted2 : memref<?xf32, strided<[?], offset: ?>> to memref<?xf32, strided<[?], offset: ?>>
  return
}
