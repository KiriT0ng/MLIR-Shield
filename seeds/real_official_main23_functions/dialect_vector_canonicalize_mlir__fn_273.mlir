func.func @no_fold_alltrue_mask_empty_body_scalar_result(
    %passthru : i32, %val : i32) -> i32 {
  %all_true = vector.constant_mask [1] : vector<1xi1>
  %result = vector.mask %all_true, %passthru { vector.yield %val : i32 } : vector<1xi1> -> i32
  return %result : i32
}
