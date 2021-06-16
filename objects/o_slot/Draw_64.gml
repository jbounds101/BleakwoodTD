// Inherit the parent event
event_inherited();

if current_unit != noone {
	// Draw the unit on the slot
	
	if draw_slot {
		draw_sprite_ext(object_get_sprite(current_unit), 0, x + sprite_width / 2, y + sprite_height / 2 
		+ sprite_get_height(object_get_sprite(current_unit)) + unit_y_offset, 
		scale * 2, scale * 2, 0, c_white, 1);
	}



	if mouse_hoverering {
		if o_input.left_click_held {
			draw_slot = false;
			o_game.unit_in_hand = current_unit;
			
		}
		else {
			// Display stats	
			draw_sprite_ext(s_gui_guide, 0, (sprite_get_width(sprite_index) / 2),
			y, scale * 3, scale * 3, 0, c_white, 1);
		}
	}

}
