// 绘制精灵
draw_self();

// 绘制状态与范围圈
if (debug_draw) {
    // 绘制检测范围
    draw_set_alpha(0.15);
    draw_set_color(c_yellow);
    draw_circle(x, y, chase_range, false);
    draw_set_color(c_red);
    draw_circle(x, y, lose_range, false);
    draw_set_alpha(1);
    
    // 绘制LOS状态
    draw_set_color(c_white);
    draw_text(x, y - 30, "State: " + state);
    draw_text(x, y - 60, "LOS: " + string(has_line_of_sight));
    
    // 绘制视线
    if (has_line_of_sight) {
        draw_set_color(c_lime);
    } else {
        draw_set_color(c_gray);
    }
    draw_line(x, y, target_instance.x, target_instance.y);
}
