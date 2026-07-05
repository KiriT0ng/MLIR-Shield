func.func @erase_barriers_second_full_fence() {
  gpu.barrier memfence [#gpu.address_space<workgroup>]
  gpu.barrier
  return
}
