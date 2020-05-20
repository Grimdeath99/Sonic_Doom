/// @description Insert description here
// You can write your code in this editor
if physics
{
	scr_player_physics(16,10,0);
	
	if ground {
	 if (gsp>0) gsp-=frc; if (gsp<0) gsp+=frc; if (gsp>0 && gsp<frc) gsp=0; if (gsp<0 && gsp>-frc) gsp=0;
	}
	if ground
	{
		physics = false;	
	}
}

if collision_circle(x+(asin*(pcolh-pcolm)),y+(acos*(pcolh-pcolm)),pcolm,obj_player_base,true,true)
{
	if !physics physics = true;
	vsp =-2;
	play.vsp=play.vsp*-1;
}

/// breaking

	//if collision_circle(x+acos*pcolw,y-asin*pcolw,8,play,true,true) && ((play.action == "spin_dash" )) {play.x+=play.acos; play.y-=play.asin}
	if collision_circle(x+acos*pcolw,y-asin*pcolw,16,play,true,true) && (play.gsp < 0 && (play.action == "rolling" ))
	{
		if !collision_circle(x+acos*(pcolw*1.7),y-asin*(pcolw*1.3),4,play,true,true)	broken = true;	
	}
	//if collision_circle(x-acos*pcolw,y+asin*pcolw,8,play,true,true) && ((play.action == "spin_dash" )) {play.x-=play.acos; play.y+=play.asin}
	if collision_circle(x-acos*pcolw,y+asin*pcolw,16,play,true,true) && (play.gsp > 0 && (play.action == "rolling" ))
	{
	  if !collision_circle(x-acos*(pcolw*1.7),y+asin*(pcolw*1.3),4,play,true,true)	broken = true;	
	}

if collision_circle(x-asin*(pcolw-pcolm*1.8),y-acos*(pcolw-pcolm*1.8),pcolm*1.4,play,true,true)
{
	if play.vsp >0	&& (play.action == "rolling" || play.action == "jumping" )
	{
			broken = true;	
			play.vsp = play.vsp*-1;
			play.ground = false;
	}
}

if broken
{
		var effectt = instance_create_layer(x,y,layer,obj_effect_fade);
		instance_create_layer(x,y,layer,obj_monitor_broken);
		effectt.sprp = spr_effect_poof;
		var temp =	instance_create_layer(x,y,layer,obj_monitor_effect);
		temp.type = type;
		temp.sprp = sprt;
		instance_destroy(id);
}
