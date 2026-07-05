func.func @rank_reducing_slice_preserve_dropped_dims(
    %arg0 : tensor<1x1x8x1xf16>, %arg1 : index) -> tensor<1x4xf16> {
  %c0 = arith.constant 0 : index
  %0 = tensor.extract_slice %arg0[%c0, 0, %arg1, 0] [1, 1, 4, 1] [1, 1, 1, 1]
    : tensor<1x1x8x1xf16> to tensor<1x4xf16>
  return %0 : tensor<1x4xf16>
}
