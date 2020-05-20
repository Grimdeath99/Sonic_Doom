/// @description scr_draw_master(character,angle_snap)
/// @function scr_draw_master
/// @param character
/// @param angle_snap

var character = argument0;
var asnap = argument1;


////////////////////////////////////////////////////////////////////////////////////

/////////// CHARACTER SELECT //////////////////////////////////

///default sonic
#region	//all varbles for character    /// add more or replace some later
var cstand = spr_ply_char_sonic_stand;

var cwalk = spr_ply_char_sonic_walk;	///the five levels of move speed in accending order
var cjog = spr_ply_char_sonic_jog;
var crun = spr_ply_char_sonic_run;
var cdash = spr_ply_char_sonic_run;
var csprint = spr_ply_char_sonic_sprint;

var cair_walk_accend = spr_ply_char_sonic_walk;
var cair_walk_dessend = spr_ply_char_sonic_walk;

var cskid = spr_ply_char_sonic_skid;
var cpush = spr_ply_char_sonic_push;

var c_ledge_forward = spr_ply_char_sonic_ledge_forward;
var c_ledge_back = spr_ply_char_sonic_ledge_backwards;

var cjump_up = spr_ply_char_sonic_jump;
var cjump_down = spr_ply_char_sonic_jump;

var cball = spr_ply_char_sonic_jump;

var cduck = spr_ply_char_sonic_duck;

var clookup = spr_ply_char_sonic_look_up;

var cspindash_normal = spr_ply_char_sonic_spindash;

var cspin_dash_charge = spr_ply_char_sonic_spindash;

var cspring_up = spr_ply_char_sonic_spring_up;
var cspring_down = spr_ply_char_sonic_corkscrew_run;

var churt = spr_ply_char_sonic_hurt;

var crev_high = spr_rev_charge;
var crev_low = spr_rev_charge;

var cdeath = spr_ply_char_sonic_death;


#endregion
///////////////
////////////////////////////////
///////////////////////////////////////
//////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//																		///
//						charter animations								///
//																		///
///////////////////////////////////////////////////////////////////////////

//// context checkes //////////////////////////////////

///ledge check
var ledge_check = 0;
if ground && scr_collision_line_left(x,y,9,asin,acos,20) && !scr_collision_line_right(x,y,9,asin,acos,20)
{
	if xdir = 1	{ledge_check = "forward"} else { ledge_check = "backward"}
}
if ground && !scr_collision_line_left(x,y,9,asin,acos,20) && scr_collision_line_right(x,y,9,asin,acos,20)
{
	if xdir = 1	{ledge_check = "backward"} else { ledge_check = "forward"}
}
if ground && scr_collision_line_left(x,y,9,asin,acos,20) && scr_collision_line_right(x,y,9,asin,acos,20)
{
	ledge_check = 0;
}



//////// general animations	$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

  if !sdeath
  {
    ///standing and idie
	
    if gsp=0 && ground && action = "default"
    {
		frame_min=-1;
		frame_max =0;
		last_action = "standing"
        if ledge_check == 0
        {
            frame_count +=0.16666666666666666666666666666667;
            sprp = spr_ply_char_sonic_stand;
        }
		
        if ledge_check == "backward" {
        frame_count +=0.125;
        sprp=	c_ledge_back;
		frame_max =-1;
		}
            if ledge_check == "forward" {
        frame_count +=0.125;
        sprp=c_ledge_forward;
		frame_max =-1;
		}
    
    }
    //walking jogging runing dashing sprinting
    if (gsp !=0 || hsp!=0 || !ground )  && action == "default"
    {
		frame_min=-1;
		frame_max =-1;
        if last_action != "runing" {image_i = 0 ; last_action = "runing"}
        if ground{ frame_duration = max(8-(abs(gsp)),1); frame_count+= (1/frame_duration);} else {frame_duration =8; frame_count+= (1/frame_duration);}
        if (!scr_collision_right(x,y,18,asin,acos,0) && xdir == 1  ) || (!scr_collision_left(x,y,18,asin,acos,0) && xdir == -1  ) {
			
				if iaskid == sprite_get_number(cskid)*8 || hcl != 0
				{
					if ground
					{
				        if abs(gsp) < 2 sprp = cwalk; 
						if abs(gsp) >=2 && abs(gsp)<4 sprp=cjog;
						if abs(gsp) >=4 && abs(gsp)<8 sprp=crun;
						if abs(gsp) >=8 && abs(gsp)<12 sprp=cdash;
						if abs(gsp) >= 12 sprp = csprint;
					}
				}
				else
				{
					sprp = cskid;
					image_i = iaskid/8;
					iaskid ++;
				}
				if gsp <= abs(0.25) {iaskid = sprite_get_number(cskid)*8}
				if abs(gsp) > 4 && iaskid == sprite_get_number(cskid)*8 && hcl == 0
				{
					if key_left	&& gsp > 3 {iaskid = 0;}
					if key_right && gsp < -3 {iaskid = 0;}
				}
            }
            else { if ground { sprp=cpush; }}
			
			if !ground
			{
				if vsp > 0 sprp = cair_walk_accend;	else sprp = cair_walk_dessend;
			}
       
    }
	else
	{
		iaskid = sprite_get_number(cskid)*8;
	}
	/*		to add later maybe
	if (hsp !=0 || !ground )  && action = 0 && screw = true
	{
		if last_standing = true || last_runing = true {image_i = 0 ; last_standing = false; last_runing = false}
        frame_duration = max(8-(xdir*hsp/2),1); frame+= (1/frame_duration);
        if !collision_sensor_right(17*scale) && !collision_sensor_left(17*scale) {
        if hsp >0 sprp = spr_sonic_flip else sprp = spr_sonic_flip1}
	}
    */
    // jumping
    if action == "jumping"
    {
			last_action = "jumping"
			frame_min=-1;
			frame_max =-1;
        frame_duration = max(5-abs(hsp),1); frame_count += 1/frame_duration;
       if vsp >0 sprp =cjump_up; else sprp= cjump_down;
    }
    /// ground rolling
    if action == "rolling"
    {
			last_action = "rolling"
			frame_min=-1;
			frame_max =-1;
			if ground  frame_duration = max(5-abs(gsp),1); else frame_duration = max(5-abs(hsp),1); 
			
			frame_count += 1/frame_duration;
        sprp =cball;
    }
    ///ducking
    if action == "ducking"
    {
		if last_action == "spin_dash" {image_i = 3; frame_min = 3; last_action = "ducking"}
        if last_action != "ducking" {image_i = 0; frame_max = 3; last_action = "ducking"}
        frame_count += 0.25;
        if image_i == frame_max-1 {frame_min = 3;}
        sprp = cduck;
    }
	    ///looking up
    if action == "looking_up"
    {
        if last_action != "looking_up" {image_i = 0; frame_max = 3; last_action = "looking_up"}
        frame_count += 0.25;
        if image_i == frame_max-1 {frame_min = 3;}
        sprp = clookup;
    }
	///super peel out
	if action == "peel_out"
	{
		last_action = "peel_out"
		frame_min=-1;
		frame_max =-1;
		frame_count +=.5;
		if spot >=17 sprp = cwalk;
		if spot >=5 && spot <17 sprp = crun;
		if spot <5 sprp = csprint;
	}

    ///spin dash
    if action == "spin_dash"
    {
		last_action = "spin_dash"
		frame_min=-1;
		frame_max =-1;
        frame_count +=.5;
        if key_ap {image_i = 0; asc = true}
        if asc = true {sprp=cspin_dash_charge; if image_i > 4 asc = false;}
        else sprp = cspindash_normal;
		if sp < 55 draw_sprite_ext(crev_low,image_i,x,y,xdir,1,0,c_white,1);
		else draw_sprite_ext(crev_high,image_i,x,y,xdir,1,0,c_white,1);
        
    }
    ///spring
    if action == "spring"
    {
        frame_count += 0.25;
        if vsp < -1 { sprp=cspring_up; }
        else
        { sprp = cspring_down;  }
    }
    
    //hurt
    if action == "hurt"
    {
        frame_count+=.125
        sprp = churt;
    }
  }
    if sdeath = true 
	{
		sprp = cdeath;
		image_i = 0;
	}
	///draw_text(x,y-50,"you're dead\n   To me");
	
	
///////////////////////////////////////////////////////////////////////////////////////
/////																				////
////						Character spesific animations							///
////																				///
///////////////////////////////////////////////////////////////////////////////////////
//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&




////////////////////////////////////////////////////////////////////////////////////////
/////																				////
////					  		Animations Base										///
////																				///
///////////////////////////////////////////////////////////////////////////////////////
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if frame_count >=1 {frame_count =0; image_i+=frame_advancement; }
if image_i > 255 image_i = 0;	//seting fame cap to 255
if image_i < 0 image_i = 255;

///making animations clamps for transition frames to happen
if image_i > frame_max && frame_max != -1 image_i = frame_min;

if image_i < frame_min && frame_min != -1 image_i = frame_min;

var dadd = choose(5,-5);   

if asnap 
{
	if ground
	{

		if angle<30 || angle>330 dangle = 0; else dangle = round(angle/22.5)*22.5;


	}
    else
    { if action = "default"
        {
            if dangle > 357 || dangle < 3 dangle = 0;
            if dangle >=3 && dangle <180 dangle -=5;
            if dangle <=357 && dangle > 180 dangle +=5;
            if dangle = 180 dangle += dadd;
        }
        else { dangle = round(angle/22.5)*22.5;} }

}
else
{
	if ground
	{
		dangle = round(angle);
	}
    else
    { if action = 0 
        {
            if dangle > 357 || dangle < 3 dangle = 0;
            if dangle >=3 && dangle <180 dangle -=5;
            if dangle <=357 && dangle > 180 dangle +=5;
            if dangle = 180 dangle += dadd;
        }
        else { dangle = round(angle);} }
}


////////////Player draw
var alp = 1;
if invulnerability > 0
{
		if invulnerability mod 8 > 3 alp = 0.2;
}
draw_sprite_ext(sprp,image_i,x,y,xdir,1,dangle,c_white,alp);

