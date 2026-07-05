func.func @empty_if1(%cond: i1) {
  scf.if %cond {
    scf.yield
  }
  return
}
