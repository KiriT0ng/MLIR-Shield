func.func @to_buffer_not_read_only(%idx : index, %f: f32) -> f32 {
  %t = tensor.generate {
  ^bb0(%i : index):
    tensor.yield %f : f32
  } : tensor<5xf32>
  // Some op may write into the result of to_buffer later.
  %m = bufferization.to_buffer %t : tensor<5xf32> to memref<5xf32>
  %2 = tensor.extract %t[%idx] : tensor<5xf32>
  return %2 : f32
}
