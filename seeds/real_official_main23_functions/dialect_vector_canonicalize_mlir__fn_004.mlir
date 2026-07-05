func.func @create_vector_mask_to_constant_mask_truncation_zero() -> (vector<4x3xi1>) {
  %c2 = arith.constant 2 : index
  %c0 = arith.constant 0 : index
  %0 = vector.create_mask %c0, %c2 : vector<4x3xi1>
  return %0 : vector<4x3xi1>
}
