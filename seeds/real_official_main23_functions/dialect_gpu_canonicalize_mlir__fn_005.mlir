func.func @erase_barriers_merge_memfence_same() {
  gpu.barrier memfence [#gpu.address_space<workgroup>]
  gpu.barrier memfence [#gpu.address_space<workgroup>]
  return
}
