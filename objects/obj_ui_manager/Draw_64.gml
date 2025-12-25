// Draw GUI 事件
var cam = instance_find(obj_camera, 0); // 获取第一个相机实例
var target = obj_target;


// 遍历并绘制可见的UI元素
if (instance_exists(cam)) {
    var keys = ds_map_keys_to_array(ui_elements);
    for (var i = 0; i < array_length(keys); i++) {
        var key = keys[i];
        var element = ui_elements[? key];
        
        if (element.visible) {
            draw_set_colour(element.colour);
            
            switch (key) {
                case "fps":
                    draw_text(element.x, element.y, "FPS: " + string(fps));
                    break;
                    
                case "camera_pos":
                    draw_text(element.x, element.y, 
                        "Cam: " + string(cam.current_x) + ", " + string(cam.current_y));
                    break;
				case "player_stats":
					if (instance_exists(obj_target)) {
						draw_text(element.x, element.y, "TarPos: " + string(obj_target.x) + ", " + string(obj_target.y));
					}
					break;
				// 添加更多GUI信息
            }
        }
    }
}