func.func @subuiExtendedUnusedBorrowVector(%arg0: vector<3xi32>, %arg1: vector<3xi32>) -> vector<3xi32> {
  %diff, %borrow = arith.subui_extended %arg0, %arg1: vector<3xi32>, vector<3xi1>
  return %diff : vector<3xi32>
}
