func.func @frontier_buffer_materialize_22(%src: tensor<8xf32>, %dst_mem: memref<8xf32>) -> tensor<8xf32> {
  %dst = bufferization.to_tensor %dst_mem restrict writable : memref<8xf32> to tensor<8xf32>
  %0 = bufferization.materialize_in_destination %src in restrict writable %dst : (tensor<8xf32>, tensor<8xf32>) -> tensor<8xf32>
  return %0 : tensor<8xf32>
}
