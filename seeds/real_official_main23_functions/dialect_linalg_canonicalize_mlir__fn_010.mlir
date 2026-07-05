func.func @self_copy(%arg0 : memref<2x3x?x4xf32>) {

  memref.copy %arg0, %arg0 : memref<2x3x?x4xf32> to memref<2x3x?x4xf32>

  return
}
