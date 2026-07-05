func.func @fold_shape_cast_with_constant_mask() -> vector<4xi1>{
  %1 = vector.constant_mask [1, 1, 1] : vector<4x1x1xi1>
  %2 = vector.shape_cast %1 : vector<4x1x1xi1> to vector<4xi1>
  return %2 : vector<4xi1>
}
