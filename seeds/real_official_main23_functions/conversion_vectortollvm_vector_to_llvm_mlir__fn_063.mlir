func.func @print_scalar_ui32(%arg0: ui32) {
  vector.print %arg0 : ui32
  return
}
