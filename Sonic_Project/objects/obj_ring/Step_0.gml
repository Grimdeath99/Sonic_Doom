/// @description Insert description here
// You can write your code in this editor
var play = obj_player_main;
if collision_circle(x+8,y+8,4,obj_player_base,true,true) && play.invulnerability < 90
{
		obj_player_main.ring ++;
		var effect = instance_create_layer(x,y,layer,obj_effect_fade);
		effect.sprp = spr_effect_ring_spark;
		instance_destroy(id);
}	