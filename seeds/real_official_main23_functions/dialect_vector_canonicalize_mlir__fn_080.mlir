func.func @dont_fold_broadcast_shapecast_diff_shape(%arg0: vector<4xf32>) -> vector<8xf32> {
    %0 = vector.broadcast %arg0 : vector<4xf32> to vector<1x2x4xf32>
    %1 = vector.shape_cast %0 : vector<1x2x4xf32> to vector<8xf32>
    return %1 : vector<8xf32>
}
