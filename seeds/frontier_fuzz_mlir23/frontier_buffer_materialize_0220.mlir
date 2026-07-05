func.func @frontier_buffer_materialize_220(%src: tensor<6xf32>, %dst_mem: memref<6xf32>) -> tensor<6xf32> {
  %dst = bufferization.to_tensor %dst_mem restrict writable : memref<6xf32> to tensor<6xf32>
  %0 = bufferization.materialize_in_destination %src in restrict writable %dst : (tensor<6xf32>, tensor<6xf32>) -> tensor<6xf32>
  return %0 : tensor<6xf32>
}
