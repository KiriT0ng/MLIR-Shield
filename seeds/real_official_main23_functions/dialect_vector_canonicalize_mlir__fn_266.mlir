func.func @fold_insert_constant_indices(%arg : vector<4x1xi32>) -> vector<4x1xi32> {
  %0 = arith.constant 0 : index
  %1 = arith.constant 1 : i32
  %res = vector.insert %1, %arg[%0, %0] : i32 into vector<4x1xi32>
  return %res : vector<4x1xi32>
}
