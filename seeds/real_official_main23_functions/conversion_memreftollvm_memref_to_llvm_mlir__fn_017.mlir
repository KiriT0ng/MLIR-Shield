func.func @rank_of_ranked(%ranked: memref<?xi32>) {
  %rank = memref.rank %ranked : memref<?xi32>
  return
}
