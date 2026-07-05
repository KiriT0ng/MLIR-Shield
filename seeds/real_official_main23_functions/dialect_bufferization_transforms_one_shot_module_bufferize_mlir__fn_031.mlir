func.func @foo(%m: memref<5xf32>) -> memref<5xf32> {
  %0 = tensor.empty() : tensor<5xf32>
  %1 = func.call @bar(%0, %m)
      : (tensor<5xf32>, memref<5xf32>) -> (memref<5xf32>)
  return %1 : memref<5xf32>
}
