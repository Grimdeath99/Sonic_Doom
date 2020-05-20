/// @description Insert description here
// You can write your code in this editor
scr_player_physics(20,20,false);
key_set_up(0);
var play = obj_player_main;
if scr_enemy_collision(play,x,y,20,10,x,y,20)
{
		if play.y > y || play.vsp < 0 { play.vsp -= sign(play.vsp);}
		if play.y < y && play.vsp >= 0 {play.vsp = play.vsp*-1;}
		var effectt = instance_create_layer(x,y,layer,obj_effect_fade);
		effectt.sprp = spr_effect_poof;
		instance_destroy(id);
}




///// ----------------------------------------------------------------------
if action_t > 0 && ground
{
	action_t --;	
}
if action_t == 0
{
		var temp = 0;
		if abs(x-start_x-distance) <= distance
		{
				if !scr_collision_left(x,y,30,asin,acos,false) && !scr_collision_right(x,y,30,asin,acos,false)
				{move_type = choose(move.left,move.stand,move.stand,move.right); temp = 1;}
				else
				{
					if scr_collision_left(x,y,30,asin,acos,false) && scr_collision_left(x-asin*64,y-acos*64,30,asin,acos,false)
					{move_type = choose(move.stand,move.right); temp = 1;}
					if scr_collision_right(x,y,30,asin,acos,false) && scr_collision_right(x-asin*64,y-acos*64,30,asin,acos,false)
					{move_type = choose(move.stand,move.left); temp = 1;}
					if scr_collision_left(x,y,30,asin,acos,false) && scr_collision_right(x,y,30,asin,acos,false)
					{move_type = choose(move.stand,move.left,move.right); temp = 1;}
					if temp = 0
					{
						move_type = choose(move.left,move.stand,move.stand,move.right);
					}
			
				}
		}
		else
		{
			if x > start_x
			{
				move_type = choose(move.left,move.stand)	
			}
			else
			{
				move_type = choose(move.stand,move.right)	
			}
		}
		action_t = action_time;
		jump = jump_time;
}

switch move_type
{
	case move.left : key_left = true;	break;
	
	case move.stand : break;
	
	case move.right : key_right = true; break;
	
}

if move_type == move.left || move_type == move.right
{
		if move_type == move.left
		{
			if scr_collision_left(x,y,30,asin,acos,false) && !scr_collision_left(x-asin*64,y-acos*64,30,asin,acos,false)
			{
				if jump > 0 jump --;	
			}
		}
		if move_type == move.right
		{
			if scr_collision_right(x,y,30,asin,acos,false) && !scr_collision_right(x-asin*64,y-acos*64,30,asin,acos,false)
			{
				if jump > 0 jump --;	
			}
		}
		if jump == 0
		{
			jump = jump_time;
			key_a = true;
			key_ap = true;
		}
}


scr_player_movement(20,20);