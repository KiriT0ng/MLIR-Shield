func.func @nested_loops_inner_loops_invariant_to_outermost_loop(%m : memref<10xindex>) {
  affine.for %arg0 = 0 to 20 {
    affine.for %arg1 = 0 to 30 {
      %v0 = affine.for %arg2 = 0 to 10 iter_args (%prevAccum = %arg1) -> index {
        %v1 = affine.load %m[%arg2] : memref<10xindex>
        %newAccum = arith.addi %prevAccum, %v1 : index
        affine.yield %newAccum : index
      }
    }
  }


  return
}
