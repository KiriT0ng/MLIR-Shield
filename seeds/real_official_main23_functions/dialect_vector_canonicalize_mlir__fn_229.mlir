func.func @from_elements_to_constant() -> vector<2x2xi32> {
  %c0_i32 = arith.constant 0 : i32
  %c1_i32 = arith.constant 1 : i32
  %c2_i32 = arith.constant 2 : i32
  %c3_i32 = arith.constant 3 : i32
  %res = vector.from_elements %c0_i32, %c1_i32, %c2_i32, %c3_i32 : vector<2x2xi32>
  return %res : vector<2x2xi32>
}
