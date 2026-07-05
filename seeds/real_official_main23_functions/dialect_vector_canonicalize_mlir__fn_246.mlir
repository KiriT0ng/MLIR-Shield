func.func @insert_vector_poison_idx_non_cst(%a: vector<4x5xf32>, %b: vector<5xf32>)
    -> vector<4x5xf32> {
  %c_neg_1 = arith.constant -1 : index
  %0 = vector.insert %b, %a[%c_neg_1] : vector<5xf32> into vector<4x5xf32>
  return %0 : vector<4x5xf32>
}
