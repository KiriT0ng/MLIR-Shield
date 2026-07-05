func.func @broadcast_of_broadcast2(%value : f32, %lane : i32) -> f32 {
  %0 = gpu.subgroup_broadcast %value, specific_lane %lane : f32
  %1 = gpu.subgroup_broadcast %0, first_active_lane : f32
  return %1 : f32
}
