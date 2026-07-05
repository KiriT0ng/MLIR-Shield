func.func @interleave_deinterleave_fold(%arg0: vector<4xf32>) -> vector<4xf32> {
  %even, %odd = vector.deinterleave %arg0 : vector<4xf32> -> vector<2xf32>
  %result = vector.interleave %even, %odd : vector<2xf32> -> vector<4xf32>
  return %result : vector<4xf32>
}
