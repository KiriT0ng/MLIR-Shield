func.func @generalize_select(%cond: memref<7x14x21xi1>, %lhs: memref<7x14x21xf32>, %rhs: memref<7x14x21xf32>,
                              %out: memref<7x14x21xf32>) {
  linalg.select ins(%cond, %lhs, %rhs: memref<7x14x21xi1>, memref<7x14x21xf32>, memref<7x14x21xf32>)
                outs(%out: memref<7x14x21xf32>)
  return
}
