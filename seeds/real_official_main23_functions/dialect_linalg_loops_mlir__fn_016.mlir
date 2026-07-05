func.func @scalar_code(%arg0: memref<f32>, %arg1 : memref<f32>, %arg2 : memref<f32>, %arg3 : i1)
{
  linalg.generic #scalar_trait
    ins(%arg0, %arg1 : memref<f32>, memref<f32>)
   outs(%arg2 : memref<f32>) {
  ^bb(%a : f32, %b : f32, %c : f32) :
    %result = scf.if %arg3 -> (f32) {
      scf.yield %a : f32
    } else {
      scf.yield %b : f32
    }
    linalg.yield %result : f32
  }
  return
}
