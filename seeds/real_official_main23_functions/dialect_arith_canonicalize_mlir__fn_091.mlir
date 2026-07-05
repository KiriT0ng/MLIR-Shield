func.func @extFPVectorConstant() -> vector<2xf128> {
  %cst = arith.constant dense<[0.000000e+00, 1.000000e+00]> : vector<2xf80>
  %0 = arith.extf %cst : vector<2xf80> to vector<2xf128>
  return %0 : vector<2xf128>
}
