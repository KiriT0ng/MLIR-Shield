func.func @memref_index_castui(%arg0: memref<3xi32>) -> memref<3xindex> {
  %0 = arith.index_castui %arg0 : memref<3xi32> to memref<3xindex>
  return %0 : memref<3xindex>
}
