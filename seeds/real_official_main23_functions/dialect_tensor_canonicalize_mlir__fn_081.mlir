func.func @no_compose_collapse_of_expand_dynamic(%arg0 : tensor<?x8x128x?xf16>, %arg1: index) -> tensor<?x128x?xf16> {
  %collapse = tensor.collapse_shape %arg0 [[0, 1, 2, 3]] : tensor<?x8x128x?xf16> into tensor<?xf16>
  %expanded_19 = tensor.expand_shape %collapse [[0, 1, 2]] output_shape [%arg1, 128, %arg1] : tensor<?xf16> into tensor<?x128x?xf16>
  return %expanded_19 : tensor<?x128x?xf16>
}
