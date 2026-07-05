func.func @constant_FPtoUI_vector() -> vector<4xi32> {
  %vector = arith.constant dense<[1.0, 3.0, 5.0, 7.0]> : vector<4xf32>
  %res = arith.fptoui %vector : vector<4xf32> to vector<4xi32>
  return %res : vector<4xi32>
}
