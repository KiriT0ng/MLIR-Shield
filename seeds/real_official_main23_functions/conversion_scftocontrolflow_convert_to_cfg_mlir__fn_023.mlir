func.func @forall(%num_threads: index) {
  scf.forall (%thread_idx) in (%num_threads) {
    "test.foo"(%thread_idx) : (index) -> ()
    scf.forall.in_parallel {
    }
  }
  return
}
