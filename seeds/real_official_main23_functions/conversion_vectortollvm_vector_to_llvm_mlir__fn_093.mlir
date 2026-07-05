func.func @create_mask_1d_scalable(%num_elems : index) -> vector<[4]xi1> {
  %v = vector.create_mask %num_elems : vector<[4]xi1>
  return %v: vector<[4]xi1>
}
