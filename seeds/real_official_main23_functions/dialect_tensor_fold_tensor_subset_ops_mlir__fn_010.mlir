func.func @extract_slice_non_one_stride(
    %src: tensor<?xf32>, %offset0: index, %offset1: index, %size0: index, %size1: index, %stride0: index, %stride1: index) -> tensor<?xf32> {
  %0 = tensor.extract_slice %src[%offset0] [%size0] [%stride0] : tensor<?xf32> to tensor<?xf32>
  %1 = tensor.extract_slice %0[%offset1] [%size1] [%stride1] : tensor<?xf32> to tensor<?xf32>
  return %1: tensor<?xf32>
}
