// 输入检测
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));

// 向量归一化
// 创建原始方向向量 (-1, 0, 1)
var dir_x = key_right - key_left;  // 右:1 左:-1 无:0
var dir_y = key_down - key_up;     // 下:1 上:-1 无:0

// 归一化
if (dir_x != 0 || dir_y != 0) {
    var len = sqrt(dir_x * dir_x + dir_y * dir_y);
    dir_x /= len;
    dir_y /= len;
}

// 计算目标位置
var target_x = x + dir_x * move_speed;
var target_y = y + dir_y * move_speed;

// 轴分离碰撞检测
// X轴检测
if (target_x != x) {
    if (!place_meeting(target_x, y, obj_wall)) {
        x = target_x;
    } else {
        while (!place_meeting(x + sign(dir_x), y, obj_wall)) {
            x += sign(dir_x);
        }
    }
}

// Y轴检测
if (target_y != y) {
    if (!place_meeting(x, target_y, obj_wall)) {
        y = target_y;
    } else {
        while (!place_meeting(x, y + sign(dir_y), obj_wall)) {
            y += sign(dir_y);
        }
    }
}
