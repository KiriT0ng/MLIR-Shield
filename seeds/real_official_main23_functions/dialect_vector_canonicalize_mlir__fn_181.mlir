func.func @insert_1d_constant() -> (vector<3xi32>, vector<3xi32>, vector<3xi32>) {
  %vcst = arith.constant dense<[0, 1, 2]> : vector<3xi32>
  %icst = arith.constant 9 : i32
  %a = vector.insert %icst, %vcst[0] : i32 into vector<3xi32>
  %b = vector.insert %icst, %vcst[1] : i32 into vector<3xi32>
  %c = vector.insert %icst, %vcst[2] : i32 into vector<3xi32>
  return %a, %b, %c : vector<3xi32>, vector<3xi32>, vector<3xi32>
}
