func.func @load_non_temporal(%arg0 : memref<32xf32, affine_map<(d0) -> (d0)>>) {
  %1 = arith.constant 7 : index
  %2 = memref.load %arg0[%1] {nontemporal = true} : memref<32xf32, affine_map<(d0) -> (d0)>>
  func.return
}
