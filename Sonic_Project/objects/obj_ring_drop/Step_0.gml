/// @description Insert description here
// You can write your code in this editor
if physics
{
	x+=hsp;
	y+=vsp;

	vsp+=grv;
	
	if hsp == 0 hsp = choose(-0.5,.5);

	if scr_collision_under(x+8,y+8,8,0,1) && vsp > 0
	{
		vsp = vsp*-0.75;	
	}

	if scr_collision_top(x+8,y+8,8,0,1) && vsp < 0
	{
		vsp = vsp*-0.5;	
	}

	if scr_collision_right(x+8,y+8,8,0,1,0) && hsp > 0
	{
		hsp = hsp*0.5;	
	}
	if scr_collision_left(x+8,y+8,8,0,1,0) && hsp < 0
	{
		hsp = hsp*0.5;	
	}
}
if distance_to_object(obj_controller) > 350 {physics = false;} else {physics = true;}

if regather > 0 regather --;
var play = obj_player_main;
if collision_circle(x+8,y+8,4,obj_player_base,true,true) && regather == 0
{
		obj_player_main.ring ++;
		var effect = instance_create_layer(x,y,layer,obj_effect_fade);
		effect.sprp = spr_effect_ring_spark;
		instance_destroy(id);
}	

if lifespan > 0 lifespan --;
if lifespan == 0
{
	instance_destroy(id);
}