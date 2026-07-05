func.func @zero_trip_loop2() {
  %idx1 = arith.constant 1 : index
  %idxm1 = arith.constant -1 : index
  scf.for %arg0 = %idx1 to %idx1 step %idxm1 {
    %138 = index.floordivs %arg0, %arg0
  }
  return
}
