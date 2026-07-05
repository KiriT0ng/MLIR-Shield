func.func @all_but_one_empty(%arg0 : !shape.shape) -> !shape.shape {
  %0 = shape.const_shape [] : !shape.shape
  %1 = shape.const_shape [] : tensor<0xindex>
  %2 = shape.broadcast %0, %arg0, %1, %0 : !shape.shape, !shape.shape,
      tensor<0xindex>, !shape.shape -> !shape.shape
  return %2 : !shape.shape
}
