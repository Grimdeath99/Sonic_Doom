 /// @description Insert description here
// You can write your code in this editor
///action code
angle = round(round(((image_angle/360))*4));  /* angle 0-3, 0 right, 1 up, 2 left, 3 down  */
if angle = 4 angle = 0
if point_in_circle(obj_player_base.x, obj_player_base.y, x, y, 30)
{
if point_in_circle(obj_player_main.x, obj_player_main.y, x, y, 30) hit_id = obj_player_main;
if instance_exists(obj_player_partner) && point_in_circle(obj_player_partner.x, obj_player_partner.y, x, y, 30) hit_id = obj_player_partner;
    if sonic_hit = false //audio_play_sound(sf_help_spring_b1,10,0);
    sonic_hit = true;

    switch angle
    {
    case 0: hit_id.hsp = spd; hit_id.vsp = -spd; break;
    case 1: hit_id.vsp = -spd; hit_id.hsp = -spd; break;
    case 2: hit_id.hsp = -spd; hit_id.vsp = spd; break;
    case 3: hit_id.vsp = spd; hit_id.hsp = spd; break;
    }
    hit_id.ground = 0; 
    hit_id.action = "spring";
    hit_id.hcl = 16;


    
}
if sonic_hit = true
{
    if animation = 0 {animation = 8; sonic_hit = false;} else {animation -=1}
}
