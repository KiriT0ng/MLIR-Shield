func.func @splatlike_fold() -> vector<4xf32> {
  %c = arith.constant 1.0 : f32
  %v = vector.broadcast %c : f32 to vector<4xf32>
  return %v : vector<4xf32>

}
