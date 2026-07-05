func.func @erase_barriers_same_scope() {
  gpu.barrier scope <subgroup>
  gpu.barrier scope <subgroup>
  return
}
