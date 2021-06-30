// Inherit the parent event
event_inherited();

if current_unit != noone {
	// Draw the unit on the slot
	
	if draw_slot {
		x_direction_towards_mouse = lerp(x_direction_towards_mouse, x + (sprite_width / 2), 0.1);
		y_direction_towards_mouse = lerp(y_direction_towards_mouse, y + (sprite_height / 2) + 
			sprite_get_height(object_get_sprite(current_unit)) + unit_y_offset, 0.1);
		
		draw_sprite_ext(object_get_sprite(current_unit), 0, x_direction_towards_mouse, 
		y_direction_towards_mouse, scale * 2, scale * 2, 0, c_white, 1);
	}



	if mouse_hoverering {
		if o_input.left_click_held {
			draw_slot = false
			o_game.unit_in_hand = current_unit;
			
		} else {
			// Display stats
			draw_slot = true;
			
			// Bottom hud
			bottom_hud_x = x + (sprite_width / 2) - (sprite_get_width(s_bottom_hud) * scale);
			bottom_hud_y = y + stats_y_offset;
			draw_sprite_ext(s_bottom_hud, current_unit.tier, bottom_hud_x,
			bottom_hud_y, scale * 2, scale * 2, 0, c_white, 1);
			
			draw_set_font(f_description);
			draw_set_valign(fa_bottom);
			
			current_line = 0;
	
			level_string = "Level: " + string(current_unit.level + 1);
			draw_text_ext_transformed_color(bottom_hud_x + bottom_hud_text_x_offset, bottom_hud_y + bottom_hud_text_y_offset + 
			(bottom_hud_line_spacing * current_line), level_string, 0, 200, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
			current_line++;
				
			current_string = "Damage:";
			draw_text_ext_transformed_color(bottom_hud_x + bottom_hud_text_x_offset, bottom_hud_y + bottom_hud_text_y_offset + 
			(bottom_hud_line_spacing * current_line), current_string, 0, 200, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
			string_end_location = string_width_ext(current_string, 0, 200) + string_width(":");
			
			number_width = 0;
			for (var i = 0; i < 3; ++i) {
				string_color = c_gray;
				if current_unit.level == i {
					string_color = c_white;
				}
				
				peep = string(current_unit.damage[i]);
				
				
		
	
	
				draw_text_ext_transformed_color(bottom_hud_x + bottom_hud_text_x_offset + string_end_location + number_width, 
					bottom_hud_y + bottom_hud_text_y_offset + (bottom_hud_line_spacing * current_line), 
					string(current_unit.damage[i]), 
					0, 200, 1, 1, 0, string_color, string_color, string_color, string_color, 1);
				number_width = string_width_ext(current_unit.damage[i], 0, 200) + bottom_hud_text_spacing;
			}
			current_line++;
			
 			
			
			x_direction_towards_mouse = lerp(x_direction_towards_mouse, (x + (sprite_width / 2) + mouse_gui_x) / 2, 0.05);
			y_direction_towards_mouse = lerp(y_direction_towards_mouse, ((y + sprite_height / 2 + 
				sprite_get_height(object_get_sprite(current_unit)) + unit_y_offset) + 
				(mouse_gui_y / 8) / 2), 0.05);
			
			
		}
	}

}
