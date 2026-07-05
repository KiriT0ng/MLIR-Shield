func.func @frontier_vector_outerproduct_80(%a: vector<[4]xf32>, %b: f32, %acc: vector<[4]xf32>, %m: vector<[4]xi1>) -> vector<[4]xf32> {
  %0 = vector.mask %m { vector.outerproduct %a, %b, %acc {kind = #vector.kind<add>} : vector<[4]xf32>, f32 } : vector<[4]xi1> -> vector<[4]xf32>
  return %0 : vector<[4]xf32>
}
