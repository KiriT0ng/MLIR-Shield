func.func @fold_broadcast_shapecast(%arg0: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.broadcast %arg0 : vector<4xf32> to vector<1x1x4xf32>
    %1 = vector.shape_cast %0 : vector<1x1x4xf32> to vector<4xf32>
    return %1 : vector<4xf32>
}
