func.func @no_fold_insert_scalar_idx_oob(%a: vector<4x5xf32>, %b: vector<5xf32>)
    -> vector<4x5xf32> {
  %c_neg_2 = arith.constant -2 : index
  %0 = vector.insert %b, %a[%c_neg_2] : vector<5xf32> into vector<4x5xf32>
  return %0 : vector<4x5xf32>
}
