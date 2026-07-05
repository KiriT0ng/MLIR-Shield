func.func @affine_if_not_invariant(%buffer: memref<1024xf32>) -> f32 {
  %sum_init_0 = arith.constant 0.0 : f32
  %sum_init_1 = arith.constant 1.0 : f32
  %res = affine.for %i = 0 to 10 step 2 iter_args(%sum_iter = %sum_init_0) -> f32 {
    %t = affine.load %buffer[%i] : memref<1024xf32>
    %sum_next = affine.if #set(%i) -> (f32) {
      %new_sum = arith.addf %sum_iter, %t : f32
      affine.yield %new_sum : f32
    } else {
      affine.yield %sum_iter : f32
    }
    %modified_sum = arith.addf %sum_next, %sum_init_1 : f32
    affine.yield %modified_sum : f32
  }
  return %res : f32
}
