func.func private @callee(%arg0: memref<?xindex, 4>) {
  %c1 = arith.constant 1 : index
  %c0 = arith.constant 0 : index
  %0 = affine.load %arg0[0] : memref<?xindex, 4>
  scf.for %arg1 = %c0 to %0 step %c1 {
  }
  return
}
