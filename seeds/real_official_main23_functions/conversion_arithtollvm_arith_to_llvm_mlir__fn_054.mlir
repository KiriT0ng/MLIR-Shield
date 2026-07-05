func.func @ops_supporting_overflow(%arg0: i64, %arg1: i64) {
  %0 = arith.addi %arg0, %arg1 overflow<nsw> : i64
  %1 = arith.subi %arg0, %arg1 overflow<nuw> : i64
  %2 = arith.muli %arg0, %arg1 overflow<nsw, nuw> : i64
  %3 = arith.shli %arg0, %arg1 overflow<nsw, nuw> : i64
  %4 = arith.trunci %arg0 overflow<nsw, nuw> : i64 to i32
  return
}
