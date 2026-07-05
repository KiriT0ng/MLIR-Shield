func.func @masked_float_max_outerprod_scalable(%arg0: vector<[2]xf32>, %arg1: f32, %arg2: vector<[2]xf32>, %m: vector<[2]xi1>) -> vector<[2]xf32> {
  %0 = vector.mask %m { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<maxnumf>} : vector<[2]xf32>, f32 } : vector<[2]xi1> -> vector<[2]xf32>
  return %0 : vector<[2]xf32>
}
