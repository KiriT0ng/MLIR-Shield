func.func @do_not_hoist_dependent_side_effect_free_op(%arg0: memref<10x512xf32>) {
  %0 = memref.alloca() : memref<1xf32>
  %cst = arith.constant 8.0 : f32
  affine.for %i = 0 to 512 {
    affine.for %j = 0 to 10 {
      %5 = affine.load %arg0[%i, %j] : memref<10x512xf32>
      %6 = affine.load %0[0] : memref<1xf32>
      %add = arith.addf %5, %6 : f32
      affine.store %add, %0[0] : memref<1xf32>
    }
    %3 = affine.load %0[0] : memref<1xf32>
    %4 = arith.mulf %3, %cst : f32 // It shouldn't be hoisted.
  }
  return
}
