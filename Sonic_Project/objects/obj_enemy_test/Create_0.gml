/// @description Insert description here
// You can write your code in this editor
scr_player_create_master();
key_set_up(0);
gsp_top = 2;

sprp = spr_obj_enemy_test_1;


start_x = x;

distance = 128;

move_type = 0;
enum move
{
	left = -1,
	stand = 0,
	right = 1
}

jump = 0;
jump_time = 10;
action_time = 70;
action_t = 0;