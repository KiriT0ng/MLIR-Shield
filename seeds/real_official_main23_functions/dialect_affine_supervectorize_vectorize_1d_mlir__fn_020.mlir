func.func @vec_rejected_unsupported_block_arg(%A : memref<512xi32>) {
  affine.for %i = 0 to 512 {
    %idx = arith.index_cast %i : index to i32
    affine.store %idx, %A[%i] : memref<512xi32>
  }
  return
}
