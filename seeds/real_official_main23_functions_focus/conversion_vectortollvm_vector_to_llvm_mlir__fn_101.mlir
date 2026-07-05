func.func @interleave_2d_scalable(%a: vector<2x[8]xi16>, %b: vector<2x[8]xi16>) -> vector<2x[16]xi16> {
  %0 = vector.interleave %a, %b : vector<2x[8]xi16> -> vector<2x[16]xi16>
  return %0 : vector<2x[16]xi16>
}
