func.func @fold_shape_cast_with_mask_scalable_one(%arg0: tensor<1x?xf32>) -> vector<1x[1]xi1>{
  %c1 = arith.constant 1 : index
  %dim = tensor.dim %arg0, %c1 : tensor<1x?xf32>
  %1 = vector.create_mask %c1, %dim, %c1 : vector<1x[1]x1xi1>
  %2 = vector.shape_cast %1 : vector<1x[1]x1xi1> to vector<1x[1]xi1>
  return %2 : vector<1x[1]xi1>
}
