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
			
			#region Bottom Hud
			bottom_hud_x = x + (sprite_width / 2) - (sprite_get_width(s_bottom_hud) * scale);
			bottom_hud_y = y + stats_y_offset;
			draw_sprite_ext(s_bottom_hud, current_unit.tier, bottom_hud_x,
			bottom_hud_y, scale * 2, scale * 2, 0, c_white, 1);
			
			draw_set_font(f_bottom_hud);
			draw_set_valign(fa_bottom);
			
			
			current_line = 0;
	
			level_string = "Level: " + string(current_unit.level + 1);
			draw_text_ext_transformed_color(bottom_hud_x + bottom_hud_text_x_offset, bottom_hud_y + bottom_hud_text_y_offset + 
			(bottom_hud_line_spacing * current_line), level_string, 0, 200, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
			current_line++;
			
			// Draw damage
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
				current_number_string = string_remove_trailing_zeros(string(current_unit.damage[i]));
				draw_text_ext_transformed_color(bottom_hud_x + bottom_hud_text_x_offset + string_end_location + number_width, 
					bottom_hud_y + bottom_hud_text_y_offset + (bottom_hud_line_spacing * current_line), current_number_string, 
					0, 200, 1, 1, 0, string_color, string_color, string_color, string_color, 1);
				// Draw number
				
				number_width = string_width_ext(current_number_string, 0, 200) + bottom_hud_text_spacing + number_width;
				// Calculate new width for new number
				
				if (i != 2) {
					// Draw number divider
					draw_text_ext_transformed_color(bottom_hud_x + bottom_hud_text_x_offset + string_end_location + 
						number_width - (bottom_hud_text_spacing / 2) - (string_width(divider_character) / 2), bottom_hud_y + bottom_hud_text_y_offset + (bottom_hud_line_spacing * current_line), divider_character, 
						0, 200, 1, 1, 0, divider_color, divider_color, divider_color, divider_color, 1);
				}
				
			}
			current_line++;
			
			// Draw attack speed
			current_string = "Speed:";
			draw_text_ext_transformed_color(bottom_hud_x + bottom_hud_text_x_offset, bottom_hud_y + bottom_hud_text_y_offset + 
			(bottom_hud_line_spacing * current_line), current_string, 0, 200, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
			string_end_location = string_width_ext(current_string, 0, 200) + string_width(":");
			
			number_width = 0;
			for (var i = 0; i < 3; ++i) {
				string_color = c_gray;
				if current_unit.level == i {
					string_color = c_white;
				}
				current_number_string = string_remove_trailing_zeros(string(current_unit.attack_speed[i]));
				draw_text_ext_transformed_color(bottom_hud_x + bottom_hud_text_x_offset + string_end_location + number_width, 
					bottom_hud_y + bottom_hud_text_y_offset + (bottom_hud_line_spacing * current_line), current_number_string, 
					0, 200, 1, 1, 0, string_color, string_color, string_color, string_color, 1);
				// Draw number
				
				number_width = string_width_ext(current_number_string, 0, 200) + bottom_hud_text_spacing + number_width;
				// Calculate new width for new number
				
				if (i != 2) {
					// Draw number divider
					draw_text_ext_transformed_color(bottom_hud_x + bottom_hud_text_x_offset + string_end_location + 
						number_width - (bottom_hud_text_spacing / 2) - (string_width(divider_character) / 2), bottom_hud_y + bottom_hud_text_y_offset + (bottom_hud_line_spacing * current_line), divider_character, 
						0, 200, 1, 1, 0, divider_color, divider_color, divider_color, divider_color, 1);
				}
				
			}
			current_line++;
			
			// Draw range
			current_string = "Range:";
			draw_text_ext_transformed_color(bottom_hud_x + bottom_hud_text_x_offset, bottom_hud_y + bottom_hud_text_y_offset + 
			(bottom_hud_line_spacing * current_line), current_string, 0, 200, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
			string_end_location = string_width_ext(current_string, 0, 200) + string_width(":");
			
			number_width = 0;
			for (var i = 0; i < 3; ++i) {
				string_color = c_gray;
				if current_unit.level == i {
					string_color = c_white;
				}
				current_number_string = string_remove_trailing_zeros(string(current_unit.range[i]));
				draw_text_ext_transformed_color(bottom_hud_x + bottom_hud_text_x_offset + string_end_location + number_width, 
					bottom_hud_y + bottom_hud_text_y_offset + (bottom_hud_line_spacing * current_line), current_number_string, 
					0, 200, 1, 1, 0, string_color, string_color, string_color, string_color, 1);
				// Draw number
				
				number_width = string_width_ext(current_number_string, 0, 200) + bottom_hud_text_spacing + number_width;
				// Calculate new width for new number
				
				if (i != 2) {
					// Draw number divider
					draw_text_ext_transformed_color(bottom_hud_x + bottom_hud_text_x_offset + string_end_location + 
						number_width - (bottom_hud_text_spacing / 2) - (string_width(divider_character) / 2), bottom_hud_y + bottom_hud_text_y_offset + (bottom_hud_line_spacing * current_line), divider_character, 
						0, 200, 1, 1, 0, divider_color, divider_color, divider_color, divider_color, 1);
				}
				
			}
			current_line++;
			
			#endregion
 			
			
			x_direction_towards_mouse = lerp(x_direction_towards_mouse, (x + (sprite_width / 2) + mouse_gui_x) / 2, 0.05);
			y_direction_towards_mouse = lerp(y_direction_towards_mouse, ((y + sprite_height / 2 + 
				sprite_get_height(object_get_sprite(current_unit)) + unit_y_offset) + 
				(mouse_gui_y / 8) / 2), 0.05);
			
			
		}
	}

}
