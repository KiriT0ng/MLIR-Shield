func.func @generic_op_1D_reduce(%arg0: memref<?xf32>, %arg1: memref<f32>)
{
  linalg.generic #trait_reduce_1D
      ins(%arg0 : memref<?xf32>)
     outs(%arg1 : memref<f32>) {
    ^bb(%a: f32, %b: f32) :
      %0 = arith.addf %a, %b : f32
      linalg.yield %0 : f32
  }
  return
}
