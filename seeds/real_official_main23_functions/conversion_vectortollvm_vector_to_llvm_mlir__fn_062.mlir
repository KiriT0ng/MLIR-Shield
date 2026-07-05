func.func @print_scalar_i32(%arg0: i32) {
  vector.print %arg0 : i32
  return
}
