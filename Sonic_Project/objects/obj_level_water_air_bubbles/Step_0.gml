/// @description Insert description here
// You can write your code in this editor
if bubble
{
	if !collision_circle(x,y-20,3,obj_water,true,true) || collision_circle(x,y-20,3,obj_wall,true,true)	
	{
		bubble = false;	
	}
	
	y+=vsp;
	x = start_x+sin(degtorad(angle))*distance;
	
	angle += rot_speed;
	angle = wrap(angle,0,359);
	
	 
	if image_i != image_final image_i +=0.2;
	
	if image_i == image_final && collision_circle(x,y,2,obj_player_base,true,true)
	{
		var play = instance_nearest(x,y,obj_player_base);
		if !play.ground
		{
			play.hsp = 0;
			play.vsp = 0;
			instance_destroy(id);	
		}
	}
	
}
else
{
	image_i +=0.2;	
}

if image_i == 10 instance_destroy(id);