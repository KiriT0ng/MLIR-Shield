func.func @insert_extract_chain(%v334: vector<3x3x4xf32>, %v34: vector<3x4xf32>, %v4: vector<4xf32>)
    -> (vector<4xf32>, vector<4xf32>, vector<3x4xf32>, vector<3x4xf32>) {
  %A34 = vector.insert %v34, %v334[0]: vector<3x4xf32> into vector<3x3x4xf32>
  %B34 = vector.insert %v34, %A34[1]: vector<3x4xf32> into vector<3x3x4xf32>
  %A4 = vector.insert %v4, %B34[1, 0]: vector<4xf32> into vector<3x3x4xf32>
  %B4 = vector.insert %v4, %A4[1, 1]: vector<4xf32> into vector<3x3x4xf32>

  // Case 2.a. [1, 1] == insertpos ([1, 1])
  // Match %A4 insertionpos and fold to its source(i.e. %V4).
   %r0 = vector.extract %B4[1, 1]: vector<4xf32> from vector<3x3x4xf32>

  // Case 3.a. insertpos ([1]) is a prefix of [1, 0].
  // Traverse %B34 to its source(i.e. %V34@[*0*]).
   %r1 = vector.extract %B34[1, 0]: vector<4xf32> from vector<3x3x4xf32>

  // Case 4. [1] is a prefix of insertpos ([1, 1]).
  // Cannot traverse %B4.
   %r2 = vector.extract %B4[1]: vector<3x4xf32> from vector<3x3x4xf32>

  // Case 5. [0] is disjoint from insertpos ([1, 1]).
  // Traverse %B4 to its dest(i.e. %A4@[0]).
  // Traverse %A4 to its dest(i.e. %B34@[0]).
  // Traverse %B34 to its dest(i.e. %A34@[0]).
  // Match %A34 insertionpos and fold to its source(i.e. %V34).
   %r3 = vector.extract %B4[0]: vector<3x4xf32> from vector<3x3x4xf32>

  return %r0, %r1, %r2, %r3:
    vector<4xf32>, vector<4xf32>, vector<3x4xf32>, vector<3x4xf32>
}
