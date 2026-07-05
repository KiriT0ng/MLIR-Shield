func.func @constant_UItoFP_splat() -> vector<4xf32> {
  %c0 = arith.constant 2 : i32
  %splat = vector.broadcast %c0 : i32 to vector<4xi32>
  %res = arith.uitofp %splat : vector<4xi32> to vector<4xf32>
  return %res : vector<4xf32>
}
