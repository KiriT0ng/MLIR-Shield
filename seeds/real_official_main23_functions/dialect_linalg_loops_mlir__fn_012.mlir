func.func @generic_op_scalar(%arg0: f32, %arg1: memref<3x4xf32>)
{
  linalg.generic #trait_broadcast
      ins(%arg0 : f32)
     outs(%arg1 : memref<3x4xf32>) {
    ^bb(%a: f32, %b: f32) :
      linalg.yield %a : f32
  }
  return
}
