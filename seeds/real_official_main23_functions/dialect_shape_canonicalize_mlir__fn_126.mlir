func.func @extract_from_shape_of_memref_no_fold(%arg0: memref<?xf32>) -> index {
  %c0 = arith.constant 0 : index
  %shape = shape.shape_of %arg0 : memref<?xf32> -> tensor<1xindex>
  %dim = tensor.extract %shape[%c0] : tensor<1xindex>
  return %dim : index
}
