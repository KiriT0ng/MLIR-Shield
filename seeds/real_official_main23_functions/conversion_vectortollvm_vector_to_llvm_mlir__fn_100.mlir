func.func @interleave_2d(%a: vector<2x3xi8>, %b: vector<2x3xi8>) -> vector<2x6xi8> {
  %0 = vector.interleave %a, %b : vector<2x3xi8> -> vector<2x6xi8>
  return %0 : vector<2x6xi8>
}
