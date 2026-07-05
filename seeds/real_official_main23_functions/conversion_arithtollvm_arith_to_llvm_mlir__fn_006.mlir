func.func @index_castui_nneg(%arg0: i1) {
  %0 = arith.index_castui %arg0 nneg : i1 to index
  return
}
