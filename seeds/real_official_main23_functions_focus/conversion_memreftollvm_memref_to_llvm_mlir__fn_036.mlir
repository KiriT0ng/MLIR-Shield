func.func @alloca_huge(%arg0 : index) {
  %1 = memref.alloca() : memref<9223372036854775807x3xi32>

  func.return
}
