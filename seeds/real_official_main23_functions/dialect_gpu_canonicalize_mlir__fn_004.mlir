func.func @erase_barriers_merge_memfence() {
  gpu.barrier memfence [#gpu.address_space<workgroup>]
  gpu.barrier memfence [#gpu.address_space<global>]
  return
}
