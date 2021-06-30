// Inherit the parent event
event_inherited();

unit_y_offset = 4;
stats_y_offset = -180;

bottom_hud_text_x_offset = 8;
bottom_hud_text_y_offset = 8;
// The amount of pixels away from 0,0 on the HUD

bottom_hud_line_spacing = 30;
// The space between lines of text

bottom_hud_text_spacing = 20;
// The space between attribute numbers


ds_list_add(o_game.unit_slots, self);
current_unit = noone;
draw_slot = true;
x_direction_towards_mouse = x + (sprite_width / 2);
y_direction_towards_mouse = 0;

