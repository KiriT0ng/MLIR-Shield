func.func @ceil_divsi_full_range(%6: index) -> index {
  %c64 = arith.constant 64 : index
  %55 = arith.ceildivsi %6, %c64 : index
  return %55 : index
}
