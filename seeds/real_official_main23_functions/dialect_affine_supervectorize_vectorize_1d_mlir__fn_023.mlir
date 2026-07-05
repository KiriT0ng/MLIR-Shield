func.func @vec_no_vecdim_last_value(%in: memref<128x256xf32>, %out: memref<256xf32>) {
 %cst = arith.constant 0.000000e+00 : f32
 affine.for %i = 0 to 256 {
   %last_val = affine.for %j = 0 to 128 iter_args(%last_iter = %cst) -> (f32) {
     %ld = affine.load %in[%j, %i] : memref<128x256xf32>
     affine.yield %ld : f32
   }
   affine.store %last_val, %out[%i] : memref<256xf32>
 }
 return
}
