func.func @reinterpret_of_reinterpret(%arg : memref<?xi8>, %size1: index, %size2: index) -> memref<?xi8> {
  %0 = memref.reinterpret_cast %arg to offset: [0], sizes: [%size1], strides: [1] : memref<?xi8> to memref<?xi8>
  %1 = memref.reinterpret_cast %0 to offset: [0], sizes: [%size2], strides: [1] : memref<?xi8> to memref<?xi8>
  return %1 : memref<?xi8>
}
