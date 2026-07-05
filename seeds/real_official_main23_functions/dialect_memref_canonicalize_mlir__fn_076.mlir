func.func @memref_realloc_dead(%src : memref<2xf32>, %v : f32) -> memref<2xf32>{
  %0 = memref.realloc %src : memref<2xf32> to memref<4xf32>
  %i2 = arith.constant 2 : index
  memref.store %v, %0[%i2] : memref<4xf32>
  return %src : memref<2xf32>
}
