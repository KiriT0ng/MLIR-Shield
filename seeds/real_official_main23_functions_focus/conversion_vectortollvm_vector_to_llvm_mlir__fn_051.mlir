func.func @masked_int_min_outerprod_scalable(%arg0: vector<[2]xi32>, %arg1: i32, %arg2: vector<[2]xi32>, %m: vector<[2]xi1>) -> vector<[2]xi32> {
  %0 = vector.mask %m { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<minui>} : vector<[2]xi32>, i32 } : vector<[2]xi1> -> vector<[2]xi32>
  return %0 : vector<[2]xi32>
}
