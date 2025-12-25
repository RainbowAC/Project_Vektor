// 步骤事件
if (!instance_exists(follow_target)) exit;

// 计算目标位置
var target_x = follow_target.x - camera_get_view_width(camera) / 2;
var target_y = follow_target.y - camera_get_view_height(camera) / 2;

// 限制在房间边界内
target_x = clamp(target_x, 0, room_width - camera_get_view_width(camera));
target_y = clamp(target_y, 0, room_height - camera_get_view_height(camera));

// 使用Lerp实现平滑移动
current_x = lerp(current_x, target_x, cam_speed);
current_y = lerp(current_y, target_y, cam_speed);

// 添加阻尼
current_x += (current_x - target_x) * (1 - damping);
current_y += (current_y - target_y) * (1 - damping);

// 应用新位置
camera_set_view_pos(camera, current_x, current_y);
