func.func @create_vector_mask_to_constant_mask_truncation() -> (vector<4x3xi1>) {
  %c2 = arith.constant 2 : index
  %c5 = arith.constant 5 : index
  %0 = vector.create_mask %c5, %c2 : vector<4x3xi1>
  return %0 : vector<4x3xi1>
}
