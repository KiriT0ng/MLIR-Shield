func.func @frontier_buffer_materialize_58(%src: tensor<4xf32>, %dst_mem: memref<4xf32>) -> tensor<4xf32> {
  %dst = bufferization.to_tensor %dst_mem restrict writable : memref<4xf32> to tensor<4xf32>
  %0 = bufferization.materialize_in_destination %src in restrict writable %dst : (tensor<4xf32>, tensor<4xf32>) -> tensor<4xf32>
  return %0 : tensor<4xf32>
}
