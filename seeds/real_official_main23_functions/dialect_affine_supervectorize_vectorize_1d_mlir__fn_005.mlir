func.func @vec_block_arg(%A : memref<32x512xi32>) {
  affine.for %i = 0 to 512 {  // vectorized
    affine.for %j = 0 to 32 {
      %idx = arith.index_cast %j : index to i32
      affine.store %idx, %A[%j, %i] : memref<32x512xi32>
    }
  }
  return
}
