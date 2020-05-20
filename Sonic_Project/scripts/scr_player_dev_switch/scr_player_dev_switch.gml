/// @description scr_player_dev_switch(mask)
/// @function scr_player_dev_switch
/// @param mask

var mask = argument0;


if collision_circle(x,y,mask,obj_dev_switch_fore,true,false)
{
	xlayer = 1;	
}
if collision_circle(x,y,mask,obj_dev_switch_back,true,false)
{
	xlayer = 0;	
}
if collision_circle(x,y,mask,obj_dev_switch_temp_act,true,false)
{
	tlayer = 1;	
}
if collision_circle(x,y,mask,obj_dev_switch_temp_deact,true,false)
{
	tlayer = 0;	
}

if collision_circle(x,y,mask,obj_dev_switch_swap,true,false)
{
	if ground
	{
		if gsp > 0 	xlayer = 0;
		if gsp < 0 xlayer = 1;
	}
}