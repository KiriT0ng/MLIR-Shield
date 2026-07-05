func.func @generalize_divu(%lhs: memref<7x14x21xi32>, %rhs: memref<7x14x21xi32>,
                          %out: memref<7x14x21xi32>) {
  linalg.div_unsigned ins(%lhs, %rhs : memref<7x14x21xi32>, memref<7x14x21xi32>)
             outs(%out : memref<7x14x21xi32>)
  return
}
