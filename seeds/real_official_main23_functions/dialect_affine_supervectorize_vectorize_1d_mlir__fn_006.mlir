func.func @vec_block_arg_2(%A : memref<?x512xindex>) {
  %c0 = arith.constant 0 : index
  %N = memref.dim %A, %c0 : memref<?x512xindex>
  affine.for %i0 = 0 to %N {
    affine.for %i1 = 0 to 512 { // vectorized
      affine.for %i2 = 0 to 2 {
        %0 = affine.load %A[%i0 * 2 + %i2 - 1, %i1] : memref<?x512xindex>
        %mul = arith.muli %i0, %0 : index
        %add = arith.addi %mul, %i2 : index
      }
    }
  }
  return
}
