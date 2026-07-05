func.func @constant_FPtoSI_splat() -> vector<4xi32> {
  %c0 = arith.constant -2.0 : f32
  %splat = vector.broadcast %c0 : f32 to vector<4xf32>
  %res = arith.fptosi %splat : vector<4xf32> to vector<4xi32>
  return %res : vector<4xi32>
}
