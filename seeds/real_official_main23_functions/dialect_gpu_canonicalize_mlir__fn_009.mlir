func.func @no_fold_different_named_barriers(%member_count : i32) {
  %nb1 = gpu.initialize_named_barrier %member_count : i32 -> !gpu.named_barrier
  %nb2 = gpu.initialize_named_barrier %member_count : i32 -> !gpu.named_barrier
  gpu.barrier named(%nb1 : !gpu.named_barrier)
  gpu.barrier named(%nb2 : !gpu.named_barrier)
  return
}
