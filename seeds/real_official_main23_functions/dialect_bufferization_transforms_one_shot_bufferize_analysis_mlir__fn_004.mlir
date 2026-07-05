func.func @read_of_alloc_tensor_is_not_a_conflict(%f: f32, %idx: index) -> f32 {
  %0 = bufferization.alloc_tensor() : tensor<10xf32>
  // This can be in-place because the read below does reads undefined data.
  %1 = tensor.insert %f into %0[%idx] : tensor<10xf32>
  %2 = tensor.extract %0[%idx] : tensor<10xf32>
  return %2 : f32
}
