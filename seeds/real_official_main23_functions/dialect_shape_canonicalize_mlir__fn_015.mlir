func.func @broadcast(%arg0 : !shape.shape, %arg1 : !shape.shape) {
  %0 = shape.broadcast %arg0, %arg1
      : !shape.shape, !shape.shape -> !shape.shape
  return
}
