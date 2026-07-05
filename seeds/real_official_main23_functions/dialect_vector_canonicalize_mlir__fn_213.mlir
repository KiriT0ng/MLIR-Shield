func.func @all_true_vector_mask_no_result(%a : vector<3x4xf32>, %m : memref<3x4xf32>) {
  %c0 = arith.constant 0 : index
  %all_true = vector.constant_mask [3, 4] : vector<3x4xi1>
  vector.mask %all_true { vector.transfer_write %a, %m[%c0, %c0] : vector<3x4xf32>, memref<3x4xf32> } : vector<3x4xi1>
  return
}
