#map0 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
func.func @ind_vector_contract_transpose_165(%a: vector<2x3xf32>, %b: vector<3x2xf32>, %acc: vector<2x2xf32>) -> vector<2x2xf32> {
  %0 = vector.contract {indexing_maps = [#map0, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %a, %b, %acc : vector<2x3xf32>, vector<3x2xf32> into vector<2x2xf32>
  %1 = vector.transpose %0, [1, 0] : vector<2x2xf32> to vector<2x2xf32>
  return %1 : vector<2x2xf32>
}
