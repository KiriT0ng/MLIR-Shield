func.func @no_fold_different_scope() {
  gpu.barrier scope <subgroup>
  gpu.barrier scope <cluster>
  return
}
