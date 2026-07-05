func.func @erase_barriers_empty_memfence() {
  gpu.barrier memfence []
  gpu.barrier memfence []
  return
}
