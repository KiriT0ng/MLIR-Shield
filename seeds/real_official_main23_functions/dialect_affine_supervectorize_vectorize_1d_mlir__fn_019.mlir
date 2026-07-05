func.func @vec_no_load_store_ops(%a: f32, %b: f32) {
 %cst = arith.constant 0.000000e+00 : f32
 affine.for %i = 0 to 128 {
   %add = arith.addf %a, %b : f32
 }

 return
}
