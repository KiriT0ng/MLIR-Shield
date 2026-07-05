func.func @frontier_buffer_materialize_184(%src: tensor<2xf32>, %dst_mem: memref<2xf32>) -> tensor<2xf32> {
  %dst = bufferization.to_tensor %dst_mem restrict writable : memref<2xf32> to tensor<2xf32>
  %0 = bufferization.materialize_in_destination %src in restrict writable %dst : (tensor<2xf32>, tensor<2xf32>) -> tensor<2xf32>
  return %0 : tensor<2xf32>
}
