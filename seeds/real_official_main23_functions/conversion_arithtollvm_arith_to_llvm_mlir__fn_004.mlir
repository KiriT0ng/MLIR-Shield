func.func @index_castui(%arg0: index, %arg1: i1) {
  %0 = arith.index_castui %arg0: index to i1
  %1 = arith.index_castui %arg1: i1 to index
  return
}
