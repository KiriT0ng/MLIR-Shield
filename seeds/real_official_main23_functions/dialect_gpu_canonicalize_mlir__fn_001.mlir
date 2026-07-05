func.func @erase_barriers() {
  gpu.barrier
  gpu.barrier
  return
}
