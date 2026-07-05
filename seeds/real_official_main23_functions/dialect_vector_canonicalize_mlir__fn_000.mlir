func.func @create_vector_mask_to_constant_mask() -> (vector<4x3xi1>) {
  %c2 = arith.constant 2 : index
  %c3 = arith.constant 3 : index
  %0 = vector.create_mask %c3, %c2 : vector<4x3xi1>
  return %0 : vector<4x3xi1>
}
