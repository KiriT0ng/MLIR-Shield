func.func @extract_shapeof(%arg0 : tensor<?x?xf64>) -> index {
 %c1 = arith.constant 1 : index
 %shape = shape.shape_of %arg0 : tensor<?x?xf64> -> tensor<2xindex>
 %result = tensor.extract %shape[%c1] : tensor<2xindex>
 return %result : index
}
