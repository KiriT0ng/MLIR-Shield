func.func @memref_bitcast(%1: memref<?xi16>) -> memref<?xbf16> {
  %2 = arith.bitcast %1 : memref<?xi16> to memref<?xbf16>
  func.return %2 : memref<?xbf16>
}
