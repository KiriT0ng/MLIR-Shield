func.func @rank_of_unranked(%unranked: memref<*xi32>) {
  %rank = memref.rank %unranked : memref<*xi32>
  return
}
