module {
  func.func @affine_sum(%arg0: memref<16xi32>, %arg1: memref<16xi32>) {
    affine.for %i = 0 to 16 {
      %0 = affine.load %arg0[%i] : memref<16xi32>
      affine.store %0, %arg1[%i] : memref<16xi32>
    }
    return
  }
}
