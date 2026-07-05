func.func @nested_parallel(%0: memref<?x?x?xf64>) -> memref<?x?x?xf64> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %1 = memref.dim %0, %c0 : memref<?x?x?xf64>
  %2 = memref.dim %0, %c1 : memref<?x?x?xf64>
  %3 = memref.dim %0, %c2 : memref<?x?x?xf64>
  %4 = memref.alloc(%1, %2, %3) : memref<?x?x?xf64>
  scf.parallel (%arg1) = (%c0) to (%1) step (%c1) {
    scf.parallel (%arg2) = (%c0) to (%2) step (%c1) {
      scf.parallel (%arg3) = (%c0) to (%3) step (%c1) {
        %5 = memref.load %0[%arg1, %arg2, %arg3] : memref<?x?x?xf64>
        memref.store %5, %4[%arg1, %arg2, %arg3] : memref<?x?x?xf64>
        scf.reduce
      }
      scf.reduce
    }
    scf.reduce
  }
  return %4 : memref<?x?x?xf64>
}
