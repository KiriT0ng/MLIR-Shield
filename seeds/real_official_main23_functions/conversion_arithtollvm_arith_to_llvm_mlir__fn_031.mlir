func.func @integer_extension_and_truncation(%arg0 : i3) {
  %0 = arith.extsi %arg0 : i3 to i6
  %1 = arith.extui %arg0 : i3 to i6
   %2 = arith.trunci %arg0 : i3 to i2
  return
}
