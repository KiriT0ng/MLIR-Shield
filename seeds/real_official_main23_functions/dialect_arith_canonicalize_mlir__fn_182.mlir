func.func @subuiExtendedConstantsBorrowVector() -> (vector<4xi32>, vector<4xi1>) {
  %v1 = arith.constant dense<[1, 3, 3, 7]> : vector<4xi32>
  %v2 = arith.constant dense<[0, 3, 4, 7]> : vector<4xi32>
  %diff, %borrow = arith.subui_extended %v1, %v2 : vector<4xi32>, vector<4xi1>
  return %diff, %borrow : vector<4xi32>, vector<4xi1>
}
