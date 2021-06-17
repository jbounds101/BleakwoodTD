function buy_unit(_unit){
	// Returns true if bought successfully, otherwise returns false
	if o_game.gold >= _unit.cost {
		// Can afford selected unit
		if o_game.empty_slots > 0 {
			// Empty spot exists, add unit to cards	
			for (var i = 0; i < ds_list_size(o_game.unit_slots) ; ++i) {
				if o_game.unit_slots[| i].current_unit == noone {
					o_game.gold -= _unit.cost;
					o_game.unit_slots[| i].current_unit = _unit;
					o_game.empty_slots -= 1;
					with o_game.unit_slots[| i] {
						y_direction_towards_mouse = y + (sprite_height / 2) + 
							sprite_get_height(object_get_sprite(current_unit)) + unit_y_offset
					}
					show_debug_message(object_get_name(_unit) + " was bought");
					return true;
				}
			}
		} else {
			// No slot available	
			show_debug_message("No slot is available for " + object_get_name(_unit));
			return false;
		}
	} else {
		// Cannot afford selected unit	
		show_debug_message("Not enough gold for " + object_get_name(_unit));
		return false;
	}
}