/// @description scr_enemy_score()
/// @function scr_enemy_score()

obj_player_main.scoreboost ++;

var sb = obj_player_main.scoreboost;
var tx = 0;

if sb == 1 {tx =100; }

if sb == 2 {tx =200;}

if sb == 3 {tx =300;}

if sb >=4 && sb <=15 {tx = 1000;}

if sb >= 16 {tx =10000;}

score +=tx;

var texty = instance_create_depth(x,y,-100,obj_effect_text);

texty.text = tx;
texty.vsp = -1;
