func.func @create_vector_mask_to_constant_mask_truncation_neg() -> (vector<4x3xi1>) {
  %cneg2 = arith.constant -2 : index
  %c5 = arith.constant 5 : index
  %0 = vector.create_mask %c5, %cneg2 : vector<4x3xi1>
  return %0 : vector<4x3xi1>
}
