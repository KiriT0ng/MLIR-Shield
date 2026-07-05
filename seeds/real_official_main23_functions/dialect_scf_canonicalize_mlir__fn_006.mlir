func.func private @side_effect()
func.func @all_unused(%cond: i1) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0, %1 = scf.if %cond -> (index, index) {
    func.call @side_effect() : () -> ()
    scf.yield %c0, %c1 : index, index
  } else {
    func.call @side_effect() : () -> ()
    scf.yield %c0, %c1 : index, index
  }
  return
}
