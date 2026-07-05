func.func @self_copy(%m1: memref<?xf32>) {
  memref.copy %m1, %m1 : memref<?xf32> to memref<?xf32>
  return
}
