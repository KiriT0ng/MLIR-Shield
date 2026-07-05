func.func @return_extract_slice(%idx: index, %sz: index) -> (tensor<2x?xf32>)
{
  %t = bufferization.alloc_tensor() : tensor<20x10xf32>
  %0 = tensor.extract_slice %t[%idx, %idx][2, %sz][1, 1]
      : tensor<20x10xf32> to tensor<2x?xf32>
  return %0 : tensor<2x?xf32>
}
