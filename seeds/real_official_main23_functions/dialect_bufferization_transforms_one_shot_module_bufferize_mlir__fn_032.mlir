func.func @bar(%t: tensor<5xf32>, %m: memref<5xf32>) -> memref<5xf32> {
  %0 = func.call @foo(%m) : (memref<5xf32>) -> (memref<5xf32>)
  return %0 : memref<5xf32>
}
