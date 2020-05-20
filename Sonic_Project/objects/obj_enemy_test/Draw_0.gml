/// @description Insert description here
// You can write your code in this editor


if ground
{
	if gsp != 0
	{
	frame_duration = max(8-(abs(gsp)),1); frame_count+= (1/frame_duration);	
	frame_min=-1;
		frame_max =-1;
	
		sprp = spr_obj_enemy_test_3;
	}
	else
	{
		frame_min=-1;
		frame_max =-1;
		sprp = spr_obj_enemy_test_1;
	}
}
else
{
	frame_min=-1;
		frame_max =-1;
	sprp = spr_obj_enemy_test_2;
	if vsp >=0	image_i = 0;
	else image_i = 1;
}



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


////////////Player draw

draw_sprite_ext(sprp,image_i,x,y,xdir,1,dangle,c_white,1);