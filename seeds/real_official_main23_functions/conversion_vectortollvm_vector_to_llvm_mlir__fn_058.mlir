func.func @print_scalar_i1(%arg0: i1) {
  vector.print %arg0 : i1
  return
}
