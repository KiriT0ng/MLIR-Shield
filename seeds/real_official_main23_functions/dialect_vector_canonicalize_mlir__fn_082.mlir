func.func @canonicalize_broadcast_shapecast_to_broadcast_ones(%arg0: vector<1x1xi8>) -> vector<1x1x6x1x4xi8> {
  %0 = vector.broadcast %arg0 : vector<1x1xi8> to vector<6x4xi8>
  %1 = vector.shape_cast %0 : vector<6x4xi8> to vector<1x1x6x1x4xi8>
  return %1 : vector<1x1x6x1x4xi8>
}
