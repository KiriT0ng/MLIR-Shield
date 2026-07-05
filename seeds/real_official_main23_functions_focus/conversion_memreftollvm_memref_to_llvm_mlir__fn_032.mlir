func.func @load_with_alignment(%arg0 : memref<32xf32>, %arg1 : index) {
  %1 = memref.load %arg0[%arg1] {alignment = 32} : memref<32xf32>
  func.return
}
