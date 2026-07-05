func.func @fold_extract_constant_indices(%arg : vector<32x1xi32>) -> i32 {
  %0 = arith.constant 0 : index
  %1 = vector.extract %arg[%0, %0] : i32 from vector<32x1xi32>
  return %1 : i32
}
