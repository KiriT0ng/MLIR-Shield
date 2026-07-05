func.func @index_cast(%arg0: index, %arg1: i1) {
  %0 = arith.index_cast %arg0: index to i1
  %1 = arith.index_cast %arg1: i1 to index
  return
}
