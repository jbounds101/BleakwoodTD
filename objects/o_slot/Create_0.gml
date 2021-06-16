// Inherit the parent event
event_inherited();

unit_y_offset = -16;
stats_mouse_y_offset = 10;


ds_list_add(o_game.unit_slots, self);
current_unit = noone;
draw_slot = true;

