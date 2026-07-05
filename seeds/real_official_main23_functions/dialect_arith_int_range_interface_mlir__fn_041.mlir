func.func @select_undefined_union(%arg0: i1) -> i1 {
  %c32 = arith.constant 32 : index
  %c64 = arith.constant 64 : index
  %0 = test.without_bounds : index
  %1 = arith.select %arg0, %0, %c64 : index
  %2 = arith.cmpi eq, %1, %c64 : index
  %3 = test.without_bounds : index
  %4 = arith.select %2, %c32, %3 : index
  %5 = arith.cmpi eq, %4, %c32 : index

  return %5 : i1
}
