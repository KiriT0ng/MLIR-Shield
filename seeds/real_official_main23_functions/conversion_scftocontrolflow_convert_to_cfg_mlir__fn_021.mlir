func.func @index_switch(%i: index, %a: i32, %b: i32, %c: i32) -> i32 {
  %0 = scf.index_switch %i -> i32
  case 0 {
    scf.yield %a : i32
  }
  case 1 {
    scf.yield %b : i32
  }
  default {
    scf.yield %c : i32
  }
  return %0 : i32
}
