func.func @single_iteration_some(%A: memref<?x?x?xi32>) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %c3 = arith.constant 3 : index
  %c6 = arith.constant 6 : index
  %c7 = arith.constant 7 : index
  %c10 = arith.constant 10 : index
  scf.parallel (%i0, %i1, %i2) = (%c0, %c3, %c7) to (%c1, %c6, %c10) step (%c1, %c2, %c3) {
    %c42 = arith.constant 42 : i32
    memref.store %c42, %A[%i0, %i1, %i2] : memref<?x?x?xi32>
    scf.reduce
  }
  return
}
