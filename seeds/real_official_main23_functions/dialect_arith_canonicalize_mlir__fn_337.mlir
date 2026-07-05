func.func @foldOrXor3(%arg0: i1) -> i1 {
  %0 = arith.constant true
  %1 = arith.xori %arg0, %0 : i1
  %2 = arith.ori %1, %arg0 : i1
  return %2 : i1
}
