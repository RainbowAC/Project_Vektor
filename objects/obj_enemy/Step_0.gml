// 目标检查
if (!instance_exists(target_instance)) exit;

// 向量计算
var dx = target_instance.x - x;
var dy = target_instance.y - y;

// 计算距离
var dist_sq = dx * dx + dy * dy;

// 视线检测
refresh_los_counter--;
if (refresh_los_counter <= 0) {
    refresh_los_counter = refresh_los_timer;
    has_line_of_sight = scr_check_los(x, y, target_instance.x, target_instance.y, obj_wall);
}

// 巡逻状态：尝试发现目标
if (state == "patrol") {
    if (dist_sq <= chase_range * chase_range && has_line_of_sight) {
        state = "chase";
        lose_target_timer = 0;
    }
}

// 追逐状态：检测是否丢失目标
if (state == "chase") {
    if (dist_sq > lose_range * lose_range) {
        // 距离过远直接放弃
        state = "patrol";
        lose_target_timer = 0;
    } else if (!has_line_of_sight) {
        // 无视线时开始计时
        lose_target_timer++;
        if (lose_target_timer >= lose_target_max) {
            state = "patrol";
            lose_target_timer = 0;
        }
    } else {
        // 保持视线时重置计时
        lose_target_timer = 0;
    }
}

// 追逐控制
if (state == "chase") {
    var dist = sqrt(dist_sq);
    
    if (dist > 0) {
        // 归一化方向
        var dir_x = dx / dist;
        var dir_y = dy / dist;
        
        // 更新实际移动角度（用于避障）
        chase_dir = point_direction(0, 0, dir_x, dir_y);
        
        // 局部避障：检测前方是否有墙
        var look_ahead_x = x + dir_x * min_distance * 0.5;
        var look_ahead_y = y + dir_y * min_distance * 0.5;
            
        if (place_meeting(look_ahead_x, look_ahead_y, obj_wall)) {
            var angle_offset = 30;  // 左右30度偏移
                
            // 测试左侧
            var left_dir_x = lengthdir_x(1, chase_dir - angle_offset);
            var left_dir_y = lengthdir_y(1, chase_dir - angle_offset);
            if (!place_meeting(x + left_dir_x * min_distance * 0.5, y + left_dir_y * min_distance * 0.5, obj_wall)) {
                dir_x = left_dir_x;
                dir_y = left_dir_y;
            } 
            // 测试右侧
            else {
                var right_dir_x = lengthdir_x(1, chase_dir + angle_offset);
                var right_dir_y = lengthdir_y(1, chase_dir + angle_offset);
                if (!place_meeting(x + right_dir_x * min_distance * 0.5, y + right_dir_y * min_distance * 0.5, obj_wall)) {
                    dir_x = right_dir_x;
                    dir_y = right_dir_y;
                }
            }
        }
        
        // 计算目标位置
        var target_x = x + dir_x * chase_speed;
        var target_y = y + dir_y * chase_speed;
        
        // 轴分离碰撞检测
        if (target_x != x) {
            if (!place_meeting(target_x, y, obj_wall)) {
                x = target_x;
            }
        }
        
        if (target_y != y) {
            if (!place_meeting(x, target_y, obj_wall)) {
                y = target_y;
            }
        }
    }
} 
// 巡逻控制
else if (state == "patrol") {
    var next_x = x + lengthdir_x(patrol_speed, patrol_dir);
    var next_y = y + lengthdir_y(patrol_speed, patrol_dir);
    
    // 如果计时器归零、碰到墙、或超出房间边界，随机新方向
    if (patrol_timer <= 0 || 
        place_meeting(next_x, next_y, obj_wall) || 
        next_x < sprite_width/2 || next_x > room_width - sprite_width/2 ||
        next_y < sprite_height/2 || next_y > room_height - sprite_height/2) {
        
        patrol_dir = random(360);
        patrol_timer = random_range(180, 360);
    } else {
        x = next_x;
        y = next_y;
    }
    
    patrol_timer--;
}