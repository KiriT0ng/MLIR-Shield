func.func @create_vector_mask_to_constant_mask_scalable_all_true() -> (vector<8x[16]xi1>) {
  %c8 = arith.constant 8 : index
  %c16 = arith.constant 16 : index
  %0 = vector.vscale
  %1 = arith.muli %0, %c16 : index
  %10 = vector.create_mask %c8, %1 : vector<8x[16]xi1>
  return %10 : vector<8x[16]xi1>
}
