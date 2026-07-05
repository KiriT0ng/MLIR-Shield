func.func @cannot_fold_transpose_cast(%arg0: memref<?x4xf32>) -> memref<?x?xf32, #transpose_map> {
    %cast = memref.cast %arg0 : memref<?x4xf32> to memref<?x?xf32>
    %transpose = memref.transpose %cast (d0, d1) -> (d1, d0) : memref<?x?xf32> to memref<?x?xf32, #transpose_map>
    return %transpose : memref<?x?xf32, #transpose_map>
}
