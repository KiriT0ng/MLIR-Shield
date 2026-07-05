func.func @partial_folding(%arg0 : !shape.shape) -> !shape.shape {
  %0 = shape.const_shape [2, 1] : !shape.shape
  %1 = shape.const_shape [1, 2, 3] : tensor<3xindex>
  %2 = shape.broadcast %0, %arg0, %1, %0 : !shape.shape, !shape.shape,
      tensor<3xindex>, !shape.shape -> !shape.shape
  return %2 : !shape.shape
}
