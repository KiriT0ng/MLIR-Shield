func.func @vec_non_vecdim_reduction(%in: memref<128x256xf32>, %out: memref<256xf32>) {
 %cst = arith.constant 0.000000e+00 : f32
 affine.for %i = 0 to 256 {
   %final_red = affine.for %j = 0 to 128 iter_args(%red_iter = %cst) -> (f32) {
     %ld = affine.load %in[%j, %i] : memref<128x256xf32>
     %add = arith.addf %red_iter, %ld : f32
     affine.yield %add : f32
   }
   affine.store %final_red, %out[%i] : memref<256xf32>
 }
 return
}
