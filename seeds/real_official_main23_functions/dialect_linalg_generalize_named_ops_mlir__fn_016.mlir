func.func @generalize_sub(%lhs: memref<7x14x21xf32>, %rhs: memref<7x14x21xf32>,
                          %out: memref<7x14x21xf32>) {
  linalg.sub ins(%lhs, %rhs : memref<7x14x21xf32>, memref<7x14x21xf32>)
             outs(%out : memref<7x14x21xf32>)
  return
}
