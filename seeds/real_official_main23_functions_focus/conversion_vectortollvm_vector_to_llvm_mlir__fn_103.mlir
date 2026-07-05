func.func @deinterleave_2d_scalable(%arg: vector<2x[8]xf32>) -> (vector<2x[4]xf32>, vector<2x[4]xf32>) {
    %0, %1 = vector.deinterleave %arg : vector<2x[8]xf32> -> vector<2x[4]xf32>
    return %0, %1 : vector<2x[4]xf32>, vector<2x[4]xf32>
}
