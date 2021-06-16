name = "Tower";
description = "A basic tower. This tower has a really long description because it is used for testing." +
" When ever I code something horrible like this,it stays put," +
" since removing it would take too much time and effort, silly.";

tier = unit_tiers.common;
damage = array_create(3,		1, 1.5, 2)
attack_delay = array_create(3,	1, 0.75, 0.5);
range = array_create(3,			100, 150, 200);

current_slot = noone;
level = 0;
xp = 0;
target = targets.first;
cost = tier + 1;