/// @description Insert description here
// You can write your code in this editor
if cam_lock!= 0 cam_lock --;
if cam_lock < 0 cam_lock = 0;

if cam_mode == 1 && cam_lock == 0
{
	var track_x, track_y;
	track_x = follow.x+follow.hsp*2;
	track_y = follow.y+follow.vsp*2;
	
	if obj_player_main.action = "looking_up" && instance_exists(obj_player_main) {if look_cont > 0 look_cont--; if look_cont == 0 && look_y > -104 look_y-=2; }
	if obj_player_main.action = "ducking" && instance_exists(obj_player_main) {if look_cont > 0 look_cont--; if look_cont == 0 && look_y < 88 look_y+=2; }
	if (obj_player_main.action != "looking_up" && obj_player_main.action !="ducking") || !instance_exists(obj_player_main)  {look_cont = 120; if look_y > 0 look_y -=2; if look_y< 0 look_y +=2;}


	
	        if !point_in_circle(x,y,track_x,track_y,2)
            {
                //move right
				if track_x >= x+dead_zone_x x+=round(min(distance_to_point(track_x-dead_zone_x,y),16));
				//move left
				if track_x <= x-dead_zone_x x-=round(min(distance_to_point(track_x+dead_zone_x,y),16));
				//move up
				if track_y <= y-dead_zone_top y-=round(min(distance_to_point(x,track_y+dead_zone_top),16));
				//move down
				if track_y >= y+dead_zone_bottom y+=round(min(distance_to_point(x,track_y-dead_zone_bottom),16));
            }

}




/////////////Hard collision
while x< 200 {x+=1;}
while x> room_width-200 {x-=1;}
while y<112 {y+=1};
while y>room_height-112 {y-=1};
while y+look_y>room_height-112{look_y--;}
while y+look_y<112{look_y++;}
///// cam reset

var viewmat = matrix_build_lookat(x,y+look_y,-100,x,y+look_y,0,0,1,0);
camera_set_view_mat(camera,viewmat);
