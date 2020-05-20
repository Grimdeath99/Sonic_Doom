/// @description Insert description here
// You can write your code in this editor
key_control(0);

if !sdeath
{
scr_player_physics(20,9,0);
scr_player_movement(20,9)
scr_player_dev_switch(10);
scr_player_damage(true);
}
else
{
	scr_player_death_physics();	
	obj_controller.cam_mode = 0;
	if death_time < death_time_max
	{
		death_time += 1;	
	}
	else
	{
			room_restart();
	}
}


if key_yp game_restart();