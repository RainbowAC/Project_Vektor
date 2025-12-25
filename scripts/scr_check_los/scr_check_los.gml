// 使用 Bresenham 直线算法检查视线
function scr_check_los(x1, y1, x2, y2, wall_obj) {
	// 使用内置函数进行精确线段碰撞检测
    // 返回 true 如果没有墙阻挡视线
    return !collision_line(x1, y1, x2, y2, wall_obj, true, true);
}