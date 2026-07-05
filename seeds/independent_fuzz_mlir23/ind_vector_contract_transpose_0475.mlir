#map0 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
func.func @ind_vector_contract_transpose_475(%a: vector<3x4xf32>, %b: vector<4x3xf32>, %acc: vector<3x3xf32>) -> vector<3x3xf32> {
  %0 = vector.contract {indexing_maps = [#map0, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %a, %b, %acc : vector<3x4xf32>, vector<4x3xf32> into vector<3x3xf32>
  %1 = vector.transpose %0, [1, 0] : vector<3x3xf32> to vector<3x3xf32>
  return %1 : vector<3x3xf32>
}
