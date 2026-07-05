func.func @transpose(%input: memref<?xf32>,
                     %init: memref<?xf32>) {
  linalg.transpose ins(%input:memref<?xf32>)
                   outs(%init:memref<?xf32>)
                   permutation = [0]
  return
}
