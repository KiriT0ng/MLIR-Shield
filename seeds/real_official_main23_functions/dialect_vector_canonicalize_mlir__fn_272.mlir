func.func @no_fold_empty_mask_scalar_result_with_passthru(
    %mask : vector<1xi1>, %passthru : i32, %val : i32) -> i32 {
  %result = vector.mask %mask, %passthru { vector.yield %val : i32 } : vector<1xi1> -> i32
  return %result : i32
}
