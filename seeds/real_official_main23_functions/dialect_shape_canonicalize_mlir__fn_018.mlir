func.func @f() -> tensor<2xindex> {
  %cs = shape.const_shape [0, 1] : !shape.shape
  %0 = shape.to_extent_tensor %cs : !shape.shape -> tensor<2xindex>
  return %0 : tensor<2xindex>
}
