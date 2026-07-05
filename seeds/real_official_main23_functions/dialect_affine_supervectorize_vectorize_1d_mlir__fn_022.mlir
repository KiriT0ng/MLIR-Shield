func.func @vec_non_vecdim_reductions(%in0: memref<128x256xf32>, %in1: memref<128x256xi32>,
                                %out0: memref<256xf32>, %out1: memref<256xi32>) {
 %zero = arith.constant 0.000000e+00 : f32
 %one = arith.constant 1 : i32
 affine.for %i = 0 to 256 {
   %red0, %red1 = affine.for %j = 0 to 128
     iter_args(%red_iter0 = %zero, %red_iter1 = %one) -> (f32, i32) {
     %ld0 = affine.load %in0[%j, %i] : memref<128x256xf32>
     %add = arith.addf %red_iter0, %ld0 : f32
     %ld1 = affine.load %in1[%j, %i] : memref<128x256xi32>
     %mul = arith.muli %red_iter1, %ld1 : i32
     affine.yield %add, %mul : f32, i32
   }
   affine.store %red0, %out0[%i] : memref<256xf32>
   affine.store %red1, %out1[%i] : memref<256xi32>
 }
 return
}
