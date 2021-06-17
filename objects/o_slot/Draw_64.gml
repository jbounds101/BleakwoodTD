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
			level_string = "Level: " + string(current_unit.level + 1);
			draw_text_ext_transformed_color(bottom_hud_x + bottom_hud_text_x_offset, bottom_hud_y + bottom_hud_text_y_offset,
				level_string, 0, 200, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
			
			
			x_direction_towards_mouse = lerp(x_direction_towards_mouse, (x + (sprite_width / 2) + mouse_gui_x) / 2, 0.05);
			y_direction_towards_mouse = lerp(y_direction_towards_mouse, ((y + sprite_height / 2 + 
				sprite_get_height(object_get_sprite(current_unit)) + unit_y_offset) + 
				(mouse_gui_y / 8) / 2), 0.05);
			
			
		}
	}

}
