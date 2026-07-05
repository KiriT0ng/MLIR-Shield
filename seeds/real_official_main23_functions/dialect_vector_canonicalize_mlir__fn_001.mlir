func.func @create_scalable_vector_mask_to_constant_mask() -> (vector<[8]xi1>) {
  %c-1 = arith.constant -1 : index
  %0 = vector.create_mask %c-1 : vector<[8]xi1>
  return %0 : vector<[8]xi1>
}
