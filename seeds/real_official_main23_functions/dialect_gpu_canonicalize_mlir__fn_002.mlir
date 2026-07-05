func.func @erase_barriers_first_full_fence() {
  gpu.barrier
  gpu.barrier memfence [#gpu.address_space<workgroup>]
  return
}
