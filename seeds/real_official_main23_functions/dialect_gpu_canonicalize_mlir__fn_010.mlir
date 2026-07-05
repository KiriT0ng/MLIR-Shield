func.func @fold_same_named_barrier(%member_count : i32) {
  %nb = gpu.initialize_named_barrier %member_count : i32 -> !gpu.named_barrier
  gpu.barrier named(%nb : !gpu.named_barrier)
  gpu.barrier named(%nb : !gpu.named_barrier)
  return
}
