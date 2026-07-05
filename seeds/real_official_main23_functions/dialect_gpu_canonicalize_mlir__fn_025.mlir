func.func @broadcast_of_broadcast1(%value : f32, %lane : i32) -> f32 {
  %0 = gpu.subgroup_broadcast %value, first_active_lane : f32
  %1 = gpu.subgroup_broadcast %0, specific_lane %lane : f32
  return %1 : f32
}
