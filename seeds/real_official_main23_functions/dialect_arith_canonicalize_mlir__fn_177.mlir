func.func @subuiExtendedSameOperandVector(%arg0: vector<4xi32>) -> (vector<4xi32>, vector<4xi1>) {
  %diff, %borrow = arith.subui_extended %arg0, %arg0: vector<4xi32>, vector<4xi1>
  return %diff, %borrow : vector<4xi32>, vector<4xi1>
}
