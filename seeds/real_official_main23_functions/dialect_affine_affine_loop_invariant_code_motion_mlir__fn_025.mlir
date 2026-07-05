func.func @use_of_iter_operands_invariant(%m : memref<10xindex>) {
  %sum_1 = arith.constant 0 : index
  %v0 = affine.for %arg1 = 0 to 11 iter_args (%prevAccum = %sum_1) -> index {
    %prod = arith.muli %sum_1, %sum_1 : index
    %newAccum = arith.addi %prevAccum, %prod : index
    affine.yield %newAccum : index
  }
  return
}
