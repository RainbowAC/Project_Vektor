// 创建事件
camera = view_camera[0];

// 跟随目标
follow_target = obj_target; //obj_player

// 相机速度
cam_speed = 0.1;
current_x = 0;
current_y = 0;

// 阻尼值
damping = 0.95;

// 初始化相机位置（防止第一帧跳动）
current_x = follow_target.x - camera_get_view_width(camera) / 2;
current_y = follow_target.y - camera_get_view_height(camera) / 2;
