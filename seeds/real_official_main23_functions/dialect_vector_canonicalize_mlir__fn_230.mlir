func.func @negative_from_elements_to_constant(%arg0: f32) -> vector<2xf32> {
  %c = arith.constant 1.0 : f32
  %res = vector.from_elements %arg0, %c : vector<2xf32>
  return %res : vector<2xf32>
}
