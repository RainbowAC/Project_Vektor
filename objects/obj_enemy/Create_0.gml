// 追逐速度
chase_speed = 2;

// 追逐范围及目标
chase_dir = 0; // 实际朝向
chase_range = 150;
lose_range = 250;
target_instance = obj_target;

// 视觉检测参数
has_line_of_sight = false; // 目标检测状态
refresh_los_timer = 30; // 每30帧刷新
min_distance = 16; //视觉距离（像素）
refresh_los_counter = 0;

//丢失目标计时器
lose_target_timer = 0;
lose_target_max = 60; // 2秒后放弃追逐（30fps）

// 巡逻参数
patrol_dir = random(360);
patrol_timer = random_range(180,360);

// 初始状态
state = "patrol"; // patrol（巡逻）/ chase（追逐）
patrol_speed = 1;

// 调试开关
debug_draw = true;