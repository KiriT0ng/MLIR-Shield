func.func @generalize_mul(%lhs: memref<7x14x21xf32>, %rhs: memref<7x14x21xf32>,
                          %out: memref<7x14x21xf32>) {
  linalg.mul ins(%lhs, %rhs : memref<7x14x21xf32>, memref<7x14x21xf32>)
             outs(%out : memref<7x14x21xf32>)
  return
}
