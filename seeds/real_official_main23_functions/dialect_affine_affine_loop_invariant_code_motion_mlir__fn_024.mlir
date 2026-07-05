func.func @affine_for_not_invariant(%in : memref<30x512xf32, 1>,
                               %out : memref<30x1xf32, 1>) {
  %sum_0 = arith.constant 0.0 : f32
  %cst_0 = arith.constant 1.1 : f32
  affine.for %j = 0 to 30 {
    %sum = affine.for %i = 0 to 512 iter_args(%sum_iter = %sum_0) -> (f32) {
      %t = affine.load %in[%j,%i] : memref<30x512xf32,1>
      %sum_next = arith.addf %sum_iter, %t : f32
      affine.yield %sum_next : f32
    }
    %mod_sum = arith.mulf %sum, %cst_0 : f32
    affine.store %mod_sum, %out[%j, 0] : memref<30x1xf32, 1>
  }
  return
}
