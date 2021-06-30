name = "Tower";
description = "A basic tower. This tower has a really long description because it is used for testing." +
" When ever I code something horrible like this, it stays put," +
" since removing it would take too much time and effort, silly.";
tier = unit_tiers.common;
damage = [1, 1.5, 2];
attack_speed = [60, 80, 100];
range = [100, 150, 200];



current_slot = noone;
level = 0;
xp = 0;
target = targets.first;
cost = tier + 1;
self_sprite = sprite_get_name(sprite_index);
top_string = string_copy(self_sprite, 1, (string_length(self_sprite) - 5)) + "_top";
top_sprite = asset_get_index(top_string);