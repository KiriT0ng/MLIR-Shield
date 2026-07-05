func.func @index_switch_fold() -> (f32, f32) {
  %switch_cst = arith.constant 1: index
  %0 = scf.index_switch %switch_cst -> f32
  case 1 {
    %y = arith.constant 1.0 : f32
    scf.yield %y : f32
  }
  default {
    %y = arith.constant 42.0 : f32
    scf.yield %y : f32
  }

  %switch_cst_2 = arith.constant 2: index
  %1 = scf.index_switch %switch_cst_2 -> f32
  case 0 {
    %y = arith.constant 0.0 : f32
    scf.yield %y : f32
  }
  default {
    %y = arith.constant 42.0 : f32
    scf.yield %y : f32
  }

  return %0, %1 : f32, f32
}
