func.func @index_switch_large_cases(%i: index) {
  scf.index_switch %i
  case 0 {
    scf.yield
  }
  case 4294967296 { // 2^32, previously truncated to 0
    scf.yield
  }
  case 8589934592 { // 2^33
    scf.yield
  }
  default {
    scf.yield
  }
  return
}
