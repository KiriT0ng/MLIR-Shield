func.func @empty_else(%cond: i1, %v : memref<i1>) {
  scf.if %cond {
    memref.store %cond, %v[] : memref<i1>
  } else {
  }
  return
}
