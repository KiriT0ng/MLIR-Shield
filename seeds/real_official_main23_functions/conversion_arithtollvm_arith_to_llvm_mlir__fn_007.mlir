func.func @index_castui_nneg_not_set(%arg0: i1) {
  %0 = arith.index_castui %arg0 : i1 to index
  return
}
