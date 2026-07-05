func.func @reinterpret_of_cast(%arg : memref<?xi8>, %size: index) -> memref<?xi8> {
  %0 = memref.cast %arg : memref<?xi8> to memref<5xi8>
  %1 = memref.reinterpret_cast %0 to offset: [0], sizes: [%size], strides: [1] : memref<5xi8> to memref<?xi8>
  return %1 : memref<?xi8>
}
