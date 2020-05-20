 /// @description Insert description here
// You can write your code in this editor
///action code
angle = round(round(((image_angle/360))*4)+1); /* angle 0-3, 0 right, 1 up, 2 left, 3 down  */
if angle = 4 angle = 0
if point_in_circle(obj_player_base.x, obj_player_base.y, x+lengthdir_x(distance,angle*90), y+lengthdir_y(distance,angle*90), mask)
{
if point_in_circle(obj_player_main.x, obj_player_main.y, x+lengthdir_x(distance,angle*90), y+lengthdir_y(distance,angle*90), mask) hit_id = obj_player_main;
if instance_exists(obj_player_partner) && point_in_circle(obj_player_partner.x, obj_player_partner.y, x+lengthdir_x(distance,angle*90), y+lengthdir_y(distance,angle*90), mask) hit_id = obj_player_partner;
    if sonic_hit = false //audio_play_sound(sf_help_spring_b1,10,0);
    sonic_hit = true;

    if angle == 0 { if ground {hit_id.gsp = spd;} else {hit_id.hsp = spd;} hit_id.vsp = 0;}
	
    if angle == 1 {hit_id.vsp = -spd; if hit_id.ground hit_id.hsp = hit_id.gsp; }
	
    if angle == 2 {if ground {hit_id.gsp = -spd;} else {hit_id.hsp = -spd;}}
	
    if angle == 3 {hit_id.vsp = spd; if hit_id.ground hit_id.hsp = hit_id.gsp;}
    
    if ground = 0 {hit_id.ground = 0; hit_id.action = "spring"; hit_id.gsp = 0;}
    else {hit_id.hcl = 16; hit_id.ground = true;}  



    
}
if sonic_hit = true
{
    if animation = 0 {animation = 8; sonic_hit = false;} else {animation -=1}
}
