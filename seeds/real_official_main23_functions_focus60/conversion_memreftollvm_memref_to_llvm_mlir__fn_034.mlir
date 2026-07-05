func.func @store_with_alignment(%arg0 : memref<32xf32>, %arg1 : f32, %arg2 : index) {
  memref.store %arg1, %arg0[%arg2] {alignment = 32} : memref<32xf32>
  func.return
}
